import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  PasswordTextField({
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
  State<PasswordTextField> createState() => _customTextformfieldState();
}

class _customTextformfieldState extends State<PasswordTextField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      readOnly: widget.readonly,
      onTap: widget.ontap,
      maxLines: widget.maxlines,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obsecureText = !obsecureText;
            });
          },
          child: widget.icon,
        ),
        filled: true,
        fillColor: AppColors.grayinputColor,
      ),
    );
  }
}
