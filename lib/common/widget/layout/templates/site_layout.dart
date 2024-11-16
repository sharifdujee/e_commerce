import 'package:flutter/cupertino.dart';

import '../../responsive.dart';
import '../../screen/desktop.dart';
import '../../screen/mobile.dart';
import '../../screen/tablet.dart';

class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.userLayout = true,
  });

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool userLayout;

  @override
  Widget build(BuildContext context) {
    return TResponsiveWidget(
      desktop: userLayout
          ? DesktopLayout(body: desktop)
          : desktop ?? Container(),
      tablet: userLayout
          ? TabletLayout(body: tablet ?? desktop)
          : tablet ?? desktop ?? Container(),
      mobile: userLayout
          ? MobileLayout(body: mobile ?? desktop)
          : mobile ?? desktop ?? Container(),
    );
  }
}
