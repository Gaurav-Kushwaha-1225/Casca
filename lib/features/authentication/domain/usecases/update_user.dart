import '../entities/user.dart';
import '../repository/user_repository.dart';

class UpdateUser {
  final UserRepository repository;

  UpdateUser(this.repository);

  Future<bool?> execute(User user) {
    return repository.updateUser(user);
  }
}
