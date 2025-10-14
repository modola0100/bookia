import 'dart:developer';

import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/showdialog.dart';
import 'package:bookia/core/functions/snackbar.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _buildforgetpasswordbody(context),
    );
  }

  Widget _buildforgetpasswordbody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showloadingDialog(context);
        } else if (state is AuthSucessState) {
          log("Success");
          pushTo(context, Routes.otp);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Password?", style: TextStyles.size30()),
              Gap(10),
              Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: TextStyles.size15(color: AppColors.graytextColor),
              ),
              Gap(30),
              customTextformfield(
                controller: cubit.emailController,
                hintText: "Enter your email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is Required";
                  }
                  return null;
                },
              ),
              Gap(40),
              customButtom(
                txt: "Send Code",
                onPressed: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.forget_password();
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
