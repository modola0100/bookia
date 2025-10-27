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
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key, required this.Otp});
  final int Otp;
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
      body: _buildcreatenewpasswordbody(context),
    );
  }

  Widget _buildcreatenewpasswordbody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          showloadingDialog(context);
        } else if (state is AuthSucessState) {
          log("Success");
          pushTo(context, Routes.NewPasswordSuccess);
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
              Text(LocaleKeys.creat_new_password.tr(), style: TextStyles.size30()),
              Gap(10),
              Text(
                LocaleKeys.creat_new_password_msg.tr(),
                style: TextStyles.size15(color: AppColors.graytextColor),
              ),
              Gap(30),
              customTextformfield(
                controller: cubit.passwordController,
                hintText: LocaleKeys.new_password.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.new_password_validate.tr();
                  }
                  return null;
                },
              ),
              Gap(20),
              customTextformfield(
                controller: cubit.confirmpasswordController,
                hintText: LocaleKeys.confirm_new_password.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.confirm_new_password_validate.tr();
                  }
                  return null;
                },
              ),
              Gap(40),
              customButtom(
                txt: LocaleKeys.reset_password.tr(),
                onPressed: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.resetpassword(Otp);
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
