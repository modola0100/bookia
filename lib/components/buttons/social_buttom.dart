import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class customSocialButtom extends StatelessWidget {
  customSocialButtom({
    super.key,
    required this.txt,
    required this.onPressed,
    this.color = AppColors.whiteColor,
    this.borderColor = AppColors.borderColor,
    this.width = double.infinity,
    this.height = 55,
    required this.socialLogo,
  });
  final String socialLogo;
  final String txt;
  final Function() onPressed;
  Color color;
  Color borderColor;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(socialLogo),
              Gap(15),
              Text(
                "$txt",
                style: TextStyles.size15(color: AppColors.darkGrayColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
