part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class SignupEvent extends AuthenticationEvent {
  final String username;
  final String name;
  final String dOB;
  final String email;
  final String password;
  final int mobNo;
  final String gender;
  final String? image;

  SignupEvent({
    required this.username,
    required this.name,
    required this.dOB,
    required this.email,
    required this.password,
    required this.mobNo,
    required this.gender,
    this.image,
  });
}
