import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/data_sources/user_database.dart';
import '../../../domain/entities/user.dart';
import '../../../data/models/user_model.dart' as UserModel;
import '../../../domain/usecases/login_user.dart';
import '../../../domain/usecases/signup_user.dart';
import '../../../domain/usecases/update_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUser loginUser;
  final SignupUser signupUser;
  final UpdateUser updateUser;

  AuthenticationBloc({required this.loginUser, required this.signupUser, required this.updateUser})
      : super(AuthenticationInitial()) {
    on<LoginEvent>(onLoginEvent);
    on<SignupEvent>(onSignupEvent);
    on<PasswordUpdateEvent>(onPasswordUpdateEvent);
    on<UserProfileUpdateEvent>(onUserProfileUpdateEvent);
  }

  void onLoginEvent(LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(UserLoading());
    try {
      final user = await loginUser.execute(event.email, event.password);
      if (user != null) {
        if (event.rememberMeCheckbox) {
          final flutterSecureStorage = FlutterSecureStorage();
          flutterSecureStorage.write(
              key: 'user', value: jsonEncode(user.toJson()));
          flutterSecureStorage.write(
              key: 'savedBarbers', value: jsonEncode([]));
          emit(UserLoaded(user: user));
        } else {
          emit(UserLoaded(user: user));
        }
      } else {
        emit(UserError(message: "Login Failed"));
      }
    } catch (e) {
      emit(UserError(message: "Error during login : $e"));
    }
  }

  void onSignupEvent(
      SignupEvent event, Emitter<AuthenticationState> emit) async {
    emit(UserLoading());
    try {
      User user = User(
          userName: event.username,
          name: event.name,
          dOB: event.dOB,
          email: event.email,
          password: event.password,
          mobNo: event.mobNo,
          gender: event.gender,
          image: event.image);
      final profile = await signupUser.execute(user);
      if (profile != null) {
        if (event.rememberMeCheckbox) {
          final flutterSecureStorage = FlutterSecureStorage();
          flutterSecureStorage.write(
              key: 'user', value: jsonEncode(profile.toJson()));
          flutterSecureStorage.write(
              key: 'savedBarbers', value: jsonEncode([]));
          emit(UserRegistered(user: profile));
        } else {
          emit(UserRegistered(user: profile));
        }
      } else {
        emit(UserError(message: "Signup Failed"));
      }
    } catch (e) {
      emit(UserError(message: "Error during signup : $e"));
    }
  }

  Future<UserModel.User?> _updatePassword(String id, String newPassword) async {
    bool isSuccess = await CascaUsersDB.updatePassword(id, newPassword);
    if (isSuccess) {
      List<UserModel.User> user = await CascaUsersDB.getUserById(id);
      return user[0];
    } else {
      return null;
    }
  }

  void onPasswordUpdateEvent(
      PasswordUpdateEvent event, Emitter<AuthenticationState> emit) async {
    emit(PasswordUpdating());
    try {
      UserModel.User? user = await _updatePassword(event.id, event.newPassword);
      if (user != null) {
        if (event.rememberMeCheckbox) {
          final flutterSecureStorage = FlutterSecureStorage();
          flutterSecureStorage.write(
              key: 'user', value: jsonEncode(user.toMap()));
          flutterSecureStorage.write(
              key: 'savedBarbers', value: jsonEncode([]));
        }
        emit(PasswordUpdatedSuccessfully(user: User.fromModelUser(user)));
      } else {
        emit(PasswordNotUpdated(message: "Password is not updated. Please try again."));
      }
    } catch (e) {
      emit(PasswordUpdateError(message: "Error during password updating : $e"));
    }
  }

  void onUserProfileUpdateEvent(UserProfileUpdateEvent event, Emitter<AuthenticationState> emit) async {
    emit(UserUpdateLoading());
    try {
      User user = User(
          id: event.id,
          userName: event.username,
          name: event.name,
          dOB: event.dOB,
          email: event.email,
          password: event.password,
          mobNo: event.mobNo,
          gender: event.gender,
          image: event.image);
      bool? isSuccess = await updateUser.execute(user);
      if (isSuccess == true) {
        final flutterSecureStorage = FlutterSecureStorage();
        flutterSecureStorage.write(
            key: 'user', value: jsonEncode(user.toJson()));
        flutterSecureStorage.write(
            key: 'savedBarbers', value: jsonEncode([]));
        emit(UserUpdated(user: user));
      } else {
        emit(UserUpdateError(message: "User Profile Update Failed 1"));
      }
    } catch (e) {
      emit(UserUpdateError(message: "User Profile Update Failed 2"));
    }
  }

  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent authEvent) async* {
    if (authEvent is LoginEvent) {
      yield UserLoading();
      try {
        final user =
            await loginUser.execute(authEvent.email, authEvent.password);
        if (user != null) {
          if (authEvent.rememberMeCheckbox) {
            final flutterSecureStorage = FlutterSecureStorage();
            flutterSecureStorage.write(
                key: 'user', value: jsonEncode(user.toJson()));
            flutterSecureStorage.write(
                key: 'savedBarbers', value: jsonEncode([]));
            yield UserLoaded(user: user);
          } else {
            yield UserLoaded(user: user);
          }
        } else {
          yield UserError(message: "Login Failed");
        }
      } catch (e) {
        yield UserError(message: "Error during login : $e");
      }
    } else if (authEvent is SignupEvent) {
      yield UserLoading();
      try {
        User user = User(
            userName: authEvent.username,
            name: authEvent.name,
            dOB: authEvent.dOB,
            email: authEvent.email,
            password: authEvent.password,
            mobNo: authEvent.mobNo,
            gender: authEvent.gender,
            image: authEvent.image);
        final profile = await signupUser.execute(user);
        if (profile != null) {
          if (authEvent.rememberMeCheckbox) {
            final flutterSecureStorage = FlutterSecureStorage();
            flutterSecureStorage.write(
                key: 'user', value: jsonEncode(profile.toJson()));
            yield UserRegistered(user: user);
          } else {
            yield UserRegistered(user: user);
          }
        } else {
          yield UserError(message: "Signup Failed");
        }
      } catch (e) {
        yield UserError(message: "Error during signup : $e");
      }
    }
  }
}
