import 'package:Casca/features/authentication/data/models/user_model.dart' as UserDataModel;

class User {
  final int id;
  final String userName;
  final String name;
  final String dOB;
  final String email;
  final int mobNo;
  final String gender;
  final String password;
  final String? image;

  User(
      {required this.id,
      required this.userName,
      required this.name,
      required this.dOB,
      required this.email,
      required this.mobNo,
      required this.gender,
      required this.password,
      this.image});

  factory User.fromModelUser(UserDataModel.User user) {
    return User(
      id: user.id,
      userName: user.userName,
      name: user.name,
      dOB: user.dOB,
      email: user.email,
      mobNo: user.mobNo,
      gender: user.gender,
      password: user.password,
      image: user.image
    );
  }
}
