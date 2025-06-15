
import 'package:business_app/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For haptic feedback
import 'package:get/get.dart';

import '../../../../core/common/widget/custom_text.dart';



void floatingPopupDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           /* _buildOption('Routine templates', () {
              HapticFeedback.mediumImpact();  // Haptic feedback on tap
              Get.offNamed(AppRoute.routineTemplate);
            }),
            _buildOption('My routines', () {
              HapticFeedback.mediumImpact();  // Haptic feedback on tap
              Get.offNamed(AppRoute.myRoutine);
            }),
            _buildOption('Create new routine', () {
              HapticFeedback.mediumImpact();  // Haptic feedback on tap
              Get.offNamed(AppRoute.createRoutine);
            }),*/
          ],
        ),
      );
    },
  );
}

Widget _buildOption(String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: (100.h),
      width: (100.w),
      padding: EdgeInsets.symmetric(horizontal: (10.w), vertical: (15.h)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xffB8B8B8),
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: CustomText(
          text: label,
          fontSize: (13.w),
          fontWeight: FontWeight.w600,
          color: Colors.white,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}