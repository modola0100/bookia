import 'package:bookia/feature/auth/data/models/auth_params.dart';
import 'package:bookia/feature/auth/data/repo/auth_repo.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  register() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    var res = await AuthRepo.register(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: 'Registration failed !'));
    }
  }

  login() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );

    var res = await AuthRepo.login(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: 'Login failed !'));
    }
  }
}
