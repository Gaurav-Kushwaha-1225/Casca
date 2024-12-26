import 'package:Casca/features/dashboard/domain/usecases/get_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_sources/barber_database.dart';
import '../../../data/models/barber_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetData getData;

  HomeBloc({required this.getData}) : super(HomeInitial()) {
    on<GetBarbersEvent>(onGetBarbersEvent);
    on<GetSavedBarbersEvent>(onGetSavedBarbersEvent);
  }

  void onGetBarbersEvent(GetBarbersEvent event, Emitter<HomeState> emit) async {
    emit(BarbersLoading());
    final data = await CascaBarberDB.getData();
    if (data != null) {
      List<Barber> barbers =
          data.map((barber) => Barber.fromMap(barber)).toList();
      emit(BarbersLoaded(barbers: barbers));
    } else {
      emit(BarbersError(message: "Barbers Data Loading Failed"));
    }
  }

  void onGetSavedBarbersEvent(
      GetSavedBarbersEvent event, Emitter<HomeState> emit) async {
    emit(SavedBarbersLoading());
    List<Barber> savedBarbers = [];
    try {
      for (int i = 0; i < event.barbers.length; i++) {
        List<Barber> bars = await CascaBarberDB.getBerberById(event.barbers[i]);
        savedBarbers.addAll(bars);
      }
      emit(SavedBarbersLoaded(barbers: savedBarbers));
    } catch (e) {
      emit(SavedBarbersError(message: "Barbers Data Loading Failed"));
    }
  }

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetBarbersEvent) {
      yield BarbersLoading();
      try {
        CascaBarberDB.connect();
        final data = await CascaBarberDB.getData();
        if (data != null) {
          List<Barber> barbers = data.map((barber) => Barber.fromMap(barber)).toList();
          yield BarbersLoaded(barbers: barbers);
        } else {
          yield BarbersError(message: "Barbers Data Loading Failed");
        }
      } catch (e) {
        yield BarbersError(message: "Error during loading data : $e");
      }
    }
  }
}
