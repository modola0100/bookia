import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/register/widgets/register_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmpasswordController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Text("Hello! Register to get started", style: TextStyles.size30()),
            Gap(30),
            customTextformfield(
              controller: userNameController,
              hintText: "Username",
            ),
            Gap(15),
            customTextformfield(controller: emailController, hintText: "email"),
            Gap(15),
            customTextformfield(
              controller: passwordController,
              hintText: "password",
            ),
            Gap(15),
            customTextformfield(
              controller: confirmpasswordController,
              hintText: "Confirm password",
            ),
            Gap(30),
            customButtom(
              txt: "Register",
              onPressed: () {
                pushAndRemoveUntil(context, Routes.main);
              },
            ),
          ],
        ),
      ),
    );
  }
}
