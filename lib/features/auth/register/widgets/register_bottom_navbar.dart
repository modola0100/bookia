import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class registerBottomNavbar extends StatelessWidget {
  const registerBottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?  ", style: TextStyles.size15()),
          TextButton(
            onPressed: () {
              pushReplacment(context, Routes.login);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              "Login",
              style: TextStyles.size15(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
