class NewPasswordParams {
  String? password;
  String? confirmpassword;
  int? otp;

  NewPasswordParams({ this.password, this.confirmpassword , this.otp});

  factory NewPasswordParams.fromJson(Map<String, dynamic> json) {
    return NewPasswordParams(
      password: json["new_password"],
      confirmpassword: json["new_password_confirmation"],
      otp: json["verify_code"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "verify_code" : otp,
      "new_password": password,
      "new_password_confirmation": confirmpassword,
    };
  }
}
