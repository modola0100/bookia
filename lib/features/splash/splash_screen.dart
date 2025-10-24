import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:bookia/services/local/shared_pref.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var userData = SharedPref.getUserData();
    Future.delayed(Duration(seconds: 3), () {
      if (userData != null) {
        pushReplacment(context, Routes.main);
      } else {
        pushReplacment(context, Routes.welcome);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logoSvg, width: 220),
            Gap(15),
            Text(LocaleKeys.slogan.tr(), style: TextStyles.size18()),
          ],
        ),
      ),
    );
  }
}
