import 'dart:developer';

import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/components/buttons/social_buttom.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/components/inputs/password_text_field.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/showdialog.dart';
import 'package:bookia/core/functions/snackbar.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/login/widgets/login_bottom_navbar.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: loginBottomNavbar(),
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
      body: SingleChildScrollView(child: _buildloginbody(context)),
    );
  }

  Widget _buildloginbody(BuildContext context) {
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
              Text(LocaleKeys.login_header.tr(), style: TextStyles.size30()),
              Gap(30),
              customTextformfield(
                controller: cubit.emailController,
                hintText: LocaleKeys.email.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.email_validate.tr();
                  }
                  return null;
                },
              ),
              Gap(15),
              PasswordTextField(
                controller: cubit.passwordController,
                hintText: LocaleKeys.password.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.password_validate.tr();
                  }
                  return null;
                },
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(AppIcons.eyeSvg),
                    ),
                  ],
                ),
              ),
              Gap(15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    pushTo(context, Routes.forget_password);
                  },
                  child: Text(
                    LocaleKeys.forget_password.tr(),
                    style: TextStyles.size15(color: AppColors.darkGrayColor),
                  ),
                ),
              ),
              Gap(30),
              customButtom(
                txt: LocaleKeys.login.tr(),
                onPressed: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.login();
                  }
                },
              ),
              Gap(35),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Gap(10),
                  Text(LocaleKeys.or.tr()),
                  Gap(10),
                  Expanded(child: Divider()),
                ],
              ),
              Gap(30),
              customSocialButtom(
                txt: LocaleKeys.google.tr(),
                onPressed: () {},
                socialLogo: AppImages.googleSvg,
              ),
              Gap(15),
              customSocialButtom(
                txt: LocaleKeys.apple.tr(),
                onPressed: () {},
                socialLogo: AppImages.appleSvg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
