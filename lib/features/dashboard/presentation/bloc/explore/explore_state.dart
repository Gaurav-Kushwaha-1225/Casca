part of 'explore_bloc.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class BarbersLoading extends ExploreState {}

class BarbersLoaded extends ExploreState {
  final List<Barber> barbers;

  BarbersLoaded({required this.barbers});
}

class BarbersError extends ExploreState {
  final String message;

  BarbersError({required this.message});
}
