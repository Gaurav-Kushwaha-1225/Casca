import 'package:Casca/features/authentication/domain/repository/user_repository.dart';

import '../entities/user.dart';

class LoginUser {
  final UserRepository repository;

  LoginUser(this.repository);

  Future<User?> login(String email, String password) {
    return repository.loginUser(email, password);
  }
}

