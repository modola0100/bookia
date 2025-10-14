import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    this.hintText,
    this.validator,
    required this.controller,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.keyboardType = TextInputType.number,
    this.borderRadius = 8.0,
  });

  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final int maxLines;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        final bool empty = value.text.isEmpty;

        return TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: textAlign,
          maxLines: maxLines,
          maxLength: 1,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (s) {
            if (s.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            filled: true,
            fillColor: AppColors.grayinputColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: empty
                    ? AppColors.grayinputColor
                    : AppColors.primaryColor,
                width: empty ? 1 : 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: empty ? AppColors.borderColor : AppColors.primaryColor,
                width: 2,
              ),
            ),
          ),
        );
      },
    );
  }
}
