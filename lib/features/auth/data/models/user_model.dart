class UserModel {
  final String? id;
  final String? userName;
  final String? email;
  final String? phone;
  final String? image;

  const UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory UserModel.fromJson(json) => UserModel(
        id: json['users_id'].toString(),
        userName: json['users_name'],
        email: json['users_email'],
        phone: json['users_phone'].toString(),
        image: json['users_image'],
      );
}
