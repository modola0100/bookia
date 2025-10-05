import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.redColor,
      content: Text(
        message,
        style: TextStyles.styleSize16(color: AppColors.whiteColor),
      ),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );
}

// showDialog(
//   context: context,
//   builder: (context) {
//     return SimpleDialog(
//       children: [
//         MainButton(
//           width: 300,
//           onPressed: () async {
//             await uploadImage(isCamera: true);
//           },
//           text: 'Upload From Camera',
//         ),
//         Gap(15),
//         MainButton(
//           width: 300,
//           onPressed: () async {
//             await uploadImage(isCamera: false);
//           },
//           text: 'Upload From Gallery',
//         ),
//       ],
//     );
//   },
// );
