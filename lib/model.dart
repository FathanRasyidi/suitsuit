class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      firstname: json['first_name'] as String,
      lastname: json['last_name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
    );
  }
}