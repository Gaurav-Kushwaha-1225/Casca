part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class BarbersLoading extends HomeState {}

class BarbersLoaded extends HomeState {
  final List<Barber> barbers;

  BarbersLoaded({required this.barbers});
}

class BarbersError extends HomeState {
  final String message;

  BarbersError({required this.message});
}
