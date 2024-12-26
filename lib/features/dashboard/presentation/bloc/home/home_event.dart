part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetBarbersEvent extends HomeEvent {
  GetBarbersEvent();
}

class GetSavedBarbersEvent extends HomeEvent {
  final List<String> barbers;
  GetSavedBarbersEvent({required this.barbers});
}
