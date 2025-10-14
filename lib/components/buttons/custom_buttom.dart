import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customButtom extends StatelessWidget {
  customButtom({
    super.key,
    required this.txt,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    this.txtColor = AppColors.whiteColor,
    this.borderColor = AppColors.primaryColor,
    this.width = double.infinity,
    this.height = 55,
  });
  final String txt;
  final Function() onPressed;
  Color color;
  Color txtColor;
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
          child: Text(
            txt,
            style: TextStyles.size15(
              color: txtColor,
              fontweight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
