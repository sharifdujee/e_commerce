import 'package:flutter/material.dart';

void floatingPopupDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Add your dialog buttons or content here
          ],
        ),
      );
    },
  );
}
