import 'package:e_commerce_admin_panel/common/widget/layout/templates/site_layout.dart';
import 'package:e_commerce_admin_panel/dashboard/widget/desktop_dashboard.dart';
import 'package:e_commerce_admin_panel/dashboard/widget/mobile_dashboard.dart';
import 'package:e_commerce_admin_panel/dashboard/widget/tablet_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: DesktopDashboardScreen(), tablet: TabletDashboardScreen(),mobile: MobileDashboardScreen(),);
  }
}
