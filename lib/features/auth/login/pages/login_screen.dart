import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/components/buttons/social_buttom.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/login/widgets/login_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Text(
              "Welcome back! Glad to see you, Again!",
              style: TextStyles.size30(),
            ),
            Gap(30),
            customTextformfield(
              controller: emailController,
              hintText: "Enter your email",
            ),
            Gap(15),
            customTextformfield(
              controller: passwordController,
              hintText: "Enter your password",
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(AppIcons.eyeSvg),
                    ),
                  ),
                ],
              ),
            ),
            Gap(15),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: TextStyles.size15(color: AppColors.darkGrayColor),
              ),
            ),
            Gap(30),
            customButtom(
              txt: "Login",
              onPressed: () {
                pushAndRemoveUntil(context, Routes.main);
              },
            ),
            Gap(35),
            Row(
              children: [
                Expanded(child: Divider()),
                Gap(10),
                Text("OR"),
                Gap(10),
                Expanded(child: Divider()),
              ],
            ),
            Gap(30),
            customSocialButtom(
              txt: "Google",
              onPressed: () {},
              socialLogo: AppImages.googleSvg,
            ),
            Gap(15),
            customSocialButtom(
              txt: "Apple",
              onPressed: () {},
              socialLogo: AppImages.appleSvg,
            ),
          ],
        ),
      ),
    );
  }
}
