class AuthParams {
  String? name;
  String? email;
  String? password;
  String? confirmpassword;
  int? otp;

  AuthParams({this.name, this.email, this.password, this.confirmpassword , this.otp});

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      confirmpassword: json["password_confirmation"],
      otp: json["verify_code"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmpassword,
      "verify_code" : otp
    };
  }
}
