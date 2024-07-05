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

  Map<String, dynamic> toMap() {
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        userName: map['userName'],
        name: map['name'],
        image: map['image'],
        dOB: map['dOB'],
        email: map['email'],
        mobNo: map['mobNo'],
        gender: map['gender'],
        password: map['password']);
  }

  factory User.fromSqfliteDatabase(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        userName: map['userName'],
        name: map['name'],
        image: map['image'],
        dOB: map['dOB'],
        email: map['email'],
        mobNo: map['mobNo'],
        gender: map['gender'],
        password: map['password']);
  }
}
