import 'package:Casca/features/authentication/data/models/user_model.dart' as UserDataModel;

class User {
  final String? id;
  final String userName;
  final String name;
  final String dOB;
  final String email;
  final int mobNo;
  final String gender;
  final String password;
  final String? image;

  User(
      {this.id,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'name': name,
      'image': image,
      'dOB': dOB,
      'email': email,
      'mobNo': mobNo,
      'gender': gender,
      'password': password
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        userName: map['userName'],
        name: map['name'],
        image: map['image'],
        dOB: map['dOB'],
        email: map['email'],
        mobNo: map['mobNo'].toInt(),
        gender: map['gender'],
        password: map['password']);
  }
}
