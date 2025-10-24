import 'package:bookia/components/buttons/custom_buttom.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.successmarkSvg),
            Gap(20),
            Text(LocaleKeys.success.tr(), style: TextStyles.size36()),
            Gap(15),
            Text(
              LocaleKeys.success_mes.tr(),
              style: TextStyles.size18(color: AppColors.graytextColor),
              textAlign: TextAlign.center,
            ),
            Gap(50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: customButtom(
                txt: LocaleKeys.back_to_home.tr(),
                onPressed: () {
                  
                  pushAndRemoveUntil(context, Routes.main, extra: 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
