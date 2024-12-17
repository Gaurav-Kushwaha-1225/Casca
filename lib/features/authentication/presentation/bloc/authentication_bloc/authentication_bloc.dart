import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_user.dart';
import '../../../domain/usecases/signup_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUser loginUser;
  final SignupUser signupUser;

  AuthenticationBloc({required this.loginUser, required this.signupUser})
      : super(AuthenticationInitial()) {
    on<LoginEvent>(onLoginEvent);
    on<SignupEvent>(onSignupEvent);
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
      bool? isSuccess = await signupUser.execute(user);
      if (isSuccess == true) {
        if (event.rememberMeCheckbox) {
          final flutterSecureStorage = FlutterSecureStorage();
          flutterSecureStorage.write(key: 'user', value: jsonEncode(user.toJson()));
          emit(UserRegistered(user: user));
        } else {
          emit(UserRegistered(user: user));
        }
      } else {
        emit(UserError(message: "Signup Failed"));
      }
    } catch (e) {
      emit(UserError(message: "Error during signup : $e"));
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
            log("object5");
            yield UserLoaded(user: user);
          } else {
            log("object");
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
        bool? isSuccess = await signupUser.execute(user);
        if (isSuccess == true) {
          if (authEvent.rememberMeCheckbox) {
            final flutterSecureStorage = FlutterSecureStorage();
            flutterSecureStorage.write(key: 'user', value: jsonEncode(user));
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
