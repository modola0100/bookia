import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customTextformfield extends StatelessWidget {
  customTextformfield({
    super.key,
    this.hintText,
    this.validator,
    required this.controller,
    this.maxlines = 1,
    this.icon,
    this.ontap,
    this.readonly = false,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  int maxlines;
  final Widget? icon;
  Function()? ontap;
  bool readonly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      onTap: ontap,
      maxLines: maxlines,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon,
        filled: true,
        fillColor: AppColors.grayinputColor,
      ),
    );
  }
}
