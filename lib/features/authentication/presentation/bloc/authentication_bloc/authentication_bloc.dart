import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
    final user = await loginUser.execute(event.email, event.password);
    if (user != null) {
      emit(UserLoaded(user: user));
    } else {
      emit(UserError(message: "Login failed"));
    }
  }

  void onSignupEvent(SignupEvent event, Emitter<AuthenticationState> emit) {
    emit(UserLoading());
    // final user = User(id: event., );
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent authEvent) async* {
    if (authEvent is LoginEvent) {
      yield UserLoading();
      try {
        final user =
            await loginUser.execute(authEvent.email, authEvent.password);
        if (user != null) {
          yield UserLoaded(user: user);
        } else {
          yield UserError(message: "Login Failed");
        }
      } catch (e) {
        yield UserError(message: "Error during login : $e");
      }
    } else if (authEvent is SignupEvent) {
      yield UserLoading();
      try {
        await signupUser.execute(User(
            id: 0,
            userName: authEvent.username,
            name: authEvent.name,
            dOB: authEvent.dOB,
            email: authEvent.email,
            password: authEvent.password,
            mobNo: authEvent.mobNo,
            gender: authEvent.gender,
            image: authEvent.image));
        yield UserRegistered();
      } catch (e) {
        yield UserError(message: "Error during signup : $e");
      }
    }
  }
}
