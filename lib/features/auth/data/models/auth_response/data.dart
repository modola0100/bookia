import 'user.dart';

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'user': user, 'token': token};
  }
}
