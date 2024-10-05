part of 'explore_bloc.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class GetBarbersSearchEvent extends ExploreEvent {
  final String searchValue;
  GetBarbersSearchEvent({required this.searchValue});
}
