import '../entities/user.dart';
import '../repository/user_repository.dart';

class SignupUser {
  final UserRepository repository;

  SignupUser(this.repository);

  Future<void> signup(User user) {
    return repository.signupUser(user);
  }
}
