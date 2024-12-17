import '../entities/user.dart';

abstract class UserRepository {
  Future<bool?> signupUser(User user);
  Future<User?> loginUser(String email, String password);
}
