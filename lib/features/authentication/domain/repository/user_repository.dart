import '../entities/user.dart';

abstract class UserRepository {
  Future<User?> signupUser(User user);
  Future<User?> loginUser(String email, String password);
  Future<bool?> updateUser(User user);
}
