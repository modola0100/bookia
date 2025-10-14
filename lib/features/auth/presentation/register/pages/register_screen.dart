import 'dart:developer';
import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/components/inputs/password_text_field.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/showdialog.dart';
import 'package:bookia/core/functions/snackbar.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/register/widgets/register_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: registerBottomNavbar(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            pop(context);
          },
          child: SvgPicture.asset(AppIcons.backSvg),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(child: _buildregsterbody(context)),
    );
  }

  Widget _buildregsterbody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showloadingDialog(context);
        } else if (state is AuthSucessState) {
          log("Success");
          pushAndRemoveUntil(context, Routes.main);
        } else {
          pop(context);
          showSnakBar(context, AppColors.redColor, "Field");
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Form(
          key: cubit.formkey,
          child: Column(
            children: [
              Text(
                "Hello! Register to get started",
                style: TextStyles.size30(),
              ),
              Gap(30),
              customTextformfield(
                controller: cubit.userNameController,
                hintText: "Username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username is Required";
                  }
                  return null;
                },
              ),
              Gap(15),
              customTextformfield(
                controller: cubit.emailController,
                hintText: "email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is Required";
                  }
                  return null;
                },
              ),
              Gap(15),
              PasswordTextField(
                controller: cubit.passwordController,
                hintText: "Enter your password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is Required";
                  }
                  return null;
                },
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(AppIcons.eyeSvg),
                    ),
                  ],
                ),
              ),
              Gap(15),
              PasswordTextField(
                controller: cubit.confirmpasswordController,
                hintText: "Confirm Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm Password is Required";
                  }
                  return null;
                },
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(AppIcons.eyeSvg),
                    ),
                  ],
                ),
              ),
              Gap(30),
              customButtom(
                txt: "Register",
                onPressed: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.register();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
