class User {
  final int? id;
  final String? userName;
  final String? name;
  final String? image;
  final String? dOB;
  final String? email;
  final String? mobNo;
  final String? gender;

  User(
      {required this.id,
      required this.userName,
      required this.name,
      this.image,
      required this.dOB,
      required this.email,
      this.mobNo,
      required this.gender});

  factory User.fromSqfliteDatabase(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['userName'],
      name: map['name'],
      image: map['image'],
      dOB: map['DOB'],
      email: map['email'],
      mobNo: map['mobNo'],
      gender: map['gender'],
    );
  }
}
