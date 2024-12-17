part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class UserLoading extends AuthenticationState {}

class UserLoaded extends AuthenticationState {
  final User user;

  UserLoaded({required this.user});
}

class UserRegistered extends AuthenticationState {
  final User user;

  UserRegistered({required this.user});
}

class UserError extends AuthenticationState {
  final String message;

  UserError({required this.message});
}

class PasswordUpdating extends AuthenticationState {}

class PasswordUpdatedSuccessfully extends AuthenticationState {
  final User user;

  PasswordUpdatedSuccessfully({required this.user});
}

class PasswordNotUpdated extends AuthenticationState {
  final String message;

  PasswordNotUpdated({required this.message});
}

class PasswordUpdateError extends AuthenticationState {
  final String message;

  PasswordUpdateError({required this.message});
}
