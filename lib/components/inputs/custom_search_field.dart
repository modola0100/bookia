import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class customSearchfield extends StatelessWidget {
  const customSearchfield({
    super.key,
    required this.controller,
    this.onChanged,
  });
  final TextEditingController controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.graytextColor,
      ),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: AppColors.darkColor, size: 30),
        filled: true,
        fillColor: AppColors.searchFieldColor,
        hintText: LocaleKeys.search.tr(),
        hintStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.graytextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.grayinputColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
      ),
    );
  }
}
