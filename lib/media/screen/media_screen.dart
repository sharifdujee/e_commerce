import 'package:e_commerce_admin_panel/common/widget/layout/templates/site_layout.dart';
import 'package:e_commerce_admin_panel/media/screen/responsive_screen/media_desktop.dart';
import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: MediaDesktop());
  }
}
