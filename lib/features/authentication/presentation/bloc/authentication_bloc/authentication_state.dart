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

class UserRegistered extends AuthenticationState {}

class UserError extends AuthenticationState {
  final String message;

  UserError({required this.message});
}
