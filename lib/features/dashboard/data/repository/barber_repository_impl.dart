import 'dart:async';

import 'package:Casca/features/dashboard/data/data_sources/barber_database.dart';

import '../../domain/repository/barber_repository.dart';

class BarberRepositoryImpl implements BarberRepository {
  final CascaBarberDB cascaBarbersDB;
  BarberRepositoryImpl(this.cascaBarbersDB);

  @override
  Future<List?> getBarbersData() async {
    return [];
  }
}
