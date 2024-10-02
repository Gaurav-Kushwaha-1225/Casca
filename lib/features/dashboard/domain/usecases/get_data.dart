import 'package:Casca/features/dashboard/domain/repository/barber_repository.dart';

class GetData {
  final BarberRepository repository;

  GetData(this.repository);

  Future<List?> execute() {
    return repository.getBarbersData();
  }
}
