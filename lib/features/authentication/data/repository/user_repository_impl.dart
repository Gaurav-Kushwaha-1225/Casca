import 'dart:async';

import 'package:Casca/features/authentication/data/data_sources/user_database.dart';
import 'package:Casca/features/authentication/domain/repository/user_repository.dart';

import '../../domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  final CascaUsersDB cascaUsersDB;
  UserRepositoryImpl(this.cascaUsersDB);

  @override
  Future<User?> signupUser(User user) async {
    final profile = await CascaUsersDB.createUser(user.userName, user.name, user.dOB,
        user.email, user.password, user.mobNo, user.gender, image: user.image);
    if (profile != null) {
      return User.fromModelUser(profile);
    } else {
      return null;
    }

  }

  @override
  Future<User?> loginUser(String email, String password) async {
    final user = await CascaUsersDB.getUserByEmailAndPassword(email, password);
    if (user != null) {
      return User.fromModelUser(user);
    } else {
      return null;
    }
  }

  @override
  Future<bool?> updateUser(User user) async {
    return await CascaUsersDB.updateUser(user.id ?? "", user.userName, user.name, user.dOB,
        user.email, user.password, user.mobNo, user.gender, user.image ?? null);
  }
}
