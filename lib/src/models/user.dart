import 'package:erantech/src/models/role.dart';

class User {
  final String name;
  final String surname;
  final bool gender;
  final String email;
  final String token;
  final List<Role> roles;

  User(
      {required this.name,
      required this.email,
      required this.surname,
      required this.gender,
        required this.token,
      required this.roles});

  factory User.fromJson(Map<String, dynamic> json, String token) {
    return User(
      name: json['name'],
      surname: json['surname'],
      gender: json['gender'] as bool,
      email: json['sub'],
      token: token,
      roles: (json['role'] as List).map((e) => Role.fromJson(e)).toList(),
    );
  }

  @override
  String toString() {
    return 'User{name: $name, surname: $surname, gender: $gender, email: $email, roles: $roles}';
  }
}
