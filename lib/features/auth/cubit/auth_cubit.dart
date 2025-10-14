import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  var formkey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var otpController1 = TextEditingController();
  var otpController2 = TextEditingController();
  var otpController3 = TextEditingController();
  var otpController4 = TextEditingController();
  var otpController5 = TextEditingController();
  var otpController6 = TextEditingController();
  AuthCubit() : super(AuthIntialState());

  register() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.register(
      AuthParams(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmpassword: confirmpasswordController.text,
      ),
    );

    if (res != null) {
      emit(AuthSucessState());
    } else {
      emit(AuthErrorState());
    }
  }

  login() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.login(
      AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (res != null) {
      emit(AuthSucessState());
    } else {
      emit(AuthErrorState());
    }
  }

  forget_password() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.forget_password(
      AuthParams(email: emailController.text),
    );

    if (res != null) {
      emit(AuthSucessState());
    } else {
      emit(AuthErrorState());
    }
  }

  verify_email() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.verify_email(
      AuthParams(email: emailController.text),
    );

    if (res != null) {
      emit(AuthSucessState());
    } else {
      emit(AuthErrorState());
    }
  }
}
