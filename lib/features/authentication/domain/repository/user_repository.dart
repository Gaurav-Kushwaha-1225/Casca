import '../entities/user.dart';

abstract class UserRepository {
  Future<int> signupUser(User user);
  Future<User?> loginUser(String email, String password);
}
