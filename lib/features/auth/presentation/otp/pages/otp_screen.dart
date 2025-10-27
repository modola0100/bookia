import 'dart:developer';

import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/components/inputs/otp_text_field.dart';
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

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});
  final String email;
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
      body: _buildotppasswordbody(context),
    );
  }
}

Widget _buildotppasswordbody(BuildContext context) {
  var cubit = context.read<AuthCubit>();
  return BlocListener<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state is AuthLoadingState) {
        showloadingDialog(context);
      } else if (state is AuthSucessState) {
        pop(context);
        log("Success");
            final otpCode = int.parse(
        cubit.otpController1.text +
            cubit.otpController2.text +
            cubit.otpController3.text +
            cubit.otpController4.text +
            cubit.otpController5.text +
            cubit.otpController6.text,
      );
      log("🚀 Sending OTP: ${cubit.otpController1.text}${cubit.otpController2.text}${cubit.otpController3.text}${cubit.otpController4.text}${cubit.otpController5.text}${cubit.otpController6.text}");
        pushTo(
          context,
          Routes.createNewPassword,
          extra: otpCode
        );
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
            Text(LocaleKeys.otp.tr(), style: TextStyles.size30()),
            Gap(10),
            Text(
              LocaleKeys.otp_msg.tr(),
              style: TextStyles.size15(color: AppColors.graytextColor),
            ),
            Gap(30),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: OtpTextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: cubit.otpController1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "missed";
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: OtpTextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: cubit.otpController2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "missed";
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: OtpTextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: cubit.otpController3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "missed";
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: OtpTextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: cubit.otpController4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "missed";
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: OtpTextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: cubit.otpController5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "missed";
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  child: OtpTextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: cubit.otpController6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "missed";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Gap(40),
            customButtom(
              txt: LocaleKeys.verify.tr(),
              onPressed: () {
                if (cubit.formkey.currentState!.validate()) {
                  cubit.Otp();
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
