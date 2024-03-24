class UserModel {
  final String? id;
  final String? userName;
  final String? email;
  final String? phone;

  const UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(json) => UserModel(
        id: json['users_id'].toString(),
        userName: json['users_name'],
        email: json['users_email'],
        phone: json['users_phone'].toString(),
      );
}
