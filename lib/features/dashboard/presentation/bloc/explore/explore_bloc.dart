import 'package:Casca/features/dashboard/domain/usecases/get_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_sources/barber_database.dart';
import '../../../data/models/barber_model.dart';
part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetData getData;

  ExploreBloc({required this.getData}) : super(ExploreInitial()) {
    on<GetBarbersSearchEvent>(onGetBarbersSearchEvent);
  }

  void onGetBarbersSearchEvent(
      GetBarbersSearchEvent event, Emitter<ExploreState> emit) async {
    emit(BarbersLoading());
    CascaBarberDB.connect();
    final data = await CascaBarberDB.getData();
    if (data != null) {
      List<Barber> barbers;
      if (event.rating == "All" && event.category == "All") {
        barbers = data.map((barber) => Barber.fromMap(barber)).toList();
      } else if (event.rating == "All") {
        barbers = data
            .where((barber) {
              return barber["types_of_services"].contains(event.category);
            })
            .map((barber) => Barber.fromMap(barber))
            .toList();
      } else if (event.category == "All") {
        barbers = data
            .where((barber) {
              return barber["stars"].toString().compareTo(event.rating) >= 0;
            })
            .map((barber) => Barber.fromMap(barber))
            .toList();
      } else {
        // log(data.first["stars"].toString().compareTo(event.rating).toString());
        // log(data.first["types_of_services"].contains(event.category).toString() + '1');
        barbers = data
            .where((barber) {
              return barber["stars"].toString().compareTo(event.rating) >= 0;
            })
            .where((barber) {
              return barber["types_of_services"].contains(event.category);
            })
            .map((barber) => Barber.fromMap(barber))
            .toList();
      }
      // log("${event.category}");
      List<Barber> searchBarbers = barbers.where((barber) {
        return barber.name
            .toLowerCase()
            .contains(event.searchValue.toLowerCase());
      }).toList();
      // log(barbers.length.toString());
      emit(BarbersLoaded(barbers: searchBarbers));
      await CascaBarberDB.close();
    } else {
      emit(BarbersError(message: "Barbers Data Loading Failed"));
    }
  }

  Stream<ExploreState> mapEventToState(ExploreEvent event) async* {
    if (event is GetBarbersSearchEvent) {
      yield BarbersLoading();
      try {
        CascaBarberDB.connect();
        final data = await CascaBarberDB.getData();
        if (data != null) {
          List<Barber> barbers;
          if (event.rating == "All" && event.category == "All") {
            barbers = data.map((barber) => Barber.fromMap(barber)).toList();
          }
          if (event.rating == "All") {
            barbers = data
                .where((barber) {
                  return barber["category"] == event.category;
                })
                .map((barber) => Barber.fromMap(barber))
                .toList();
          }
          if (event.category == "All") {
            barbers = data
                .where((barber) {
                  return barber["stars"].toString().compareTo(event.rating) >=
                      0;
                })
                .map((barber) => Barber.fromMap(barber))
                .toList();
          } else {
            barbers = data
                .where((barber) {
                  return barber["stars"].toString().compareTo(event.rating) >=
                          0 &&
                      barber["category"] == event.category;
                })
                .map((barber) => Barber.fromMap(barber))
                .toList();
          }
          List<Barber> searchBarbers = barbers.where((barber) {
            return barber.name
                .toLowerCase()
                .contains(event.searchValue.toLowerCase());
          }).toList();
          yield BarbersLoaded(barbers: searchBarbers);
          await CascaBarberDB.close();
        } else {
          yield BarbersError(message: "Barbers Data Loading Failed");
        }
      } catch (e) {
        yield BarbersError(message: "Error during loading data : $e");
      }
    }
  }
}
