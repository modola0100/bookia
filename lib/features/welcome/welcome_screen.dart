import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcome,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Spacer(flex: 2),
                SvgPicture.asset(AppImages.logoSvg, width: 220),
                Gap(15),
                Text("Order Your Book Now!", style: TextStyles.size18()),
                Spacer(flex: 8),
                customButtom(
                  txt: "Login",
                  onPressed: () {
                    pushTo(context, Routes.login);
                  },
                ),
                Gap(20),
                customButtom(
                  txt: "Register",
                  onPressed: () {
                    pushTo(context, Routes.register);
                  },
                  txtColor: AppColors.darkColor,
                  color: AppColors.whiteColor,
                  borderColor: AppColors.darkColor,
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
