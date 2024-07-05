import '../entities/user.dart';

abstract class UserRepository {
  Future<void> signupUser(User user);
  Future<User?> loginUser(String email, String password);
}
