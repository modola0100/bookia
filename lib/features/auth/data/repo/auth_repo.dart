import 'dart:developer';

import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/services/dio/dio_endpoints.dart';
import 'package:bookia/services/dio/dio_provider.dart';
import 'package:bookia/services/local/shared_pref.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.register,
        data: params.toJson(),
      );

      if (res.statusCode == 201) {
        var body = res.data;
        var userObj = AuthResponse.fromJson(body);
        SharedPref.saveUserData(userObj.data);
        return userObj;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.login,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        var body = res.data;

        return AuthResponse.fromJson(body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forget_password(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.forget_password,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        var body = res.data;

        return AuthResponse.fromJson(body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> verify_email(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.otp,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        var body = res.data;

        return AuthResponse.fromJson(body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
