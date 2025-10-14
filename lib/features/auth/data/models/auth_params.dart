class AuthParams {
  String? name;
  String? email;
  String? password;
  String? confirmpassword;

  AuthParams({this.name, this.email, this.password, this.confirmpassword});

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      confirmpassword: json["password_confirmation"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmpassword,
    };
  }
}
