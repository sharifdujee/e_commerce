import 'package:animations/animations.dart';
import 'package:e_commerce_ui/route/route_constants.dart';
import 'package:e_commerce_ui/screen/bookmark/views/bookmark_screen.dart';
import 'package:e_commerce_ui/screen/checkout/views/cart_screen.dart';
import 'package:e_commerce_ui/screen/discover/views/discover_screen.dart';
import 'package:e_commerce_ui/screen/home/views/home_screen.dart';
import 'package:e_commerce_ui/screen/profile/views/profile_screen.dart';
import 'package:e_commerce_ui/screen/wallet/views/empty_wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  /// bottom Navbar screen indicator
  final List _page = const [
    HomeScreen(),
    DiscoverScreen(),
    BookmarkScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            BlendMode.srcIn),
      );
    }

    return Scaffold(
      appBar: AppBar(
        // pinned: true,
        //floating: true,
        // snap: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/logo/Shoplon.svg",
          colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!, BlendMode.srcIn),
          height: 20,
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchScreenRoute);
            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 24,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodyLarge!.color!,
                  BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, notificationsScreenRoute);
            },
            icon: SvgPicture.asset(
              "assets/icons/Notification.svg",
              height: 24,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodyLarge!.color!,
                  BlendMode.srcIn),
            ),
          ),
        ],
      ),
      /// page transaction UI
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,

          );
        },
        child: _page[_currentIndex],
      ),
      /// end page tran

      /// bottom navigation start
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              if (index != _currentIndex) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : const Color(0xFF101015),
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Shop.svg"),
                activeIcon:
                    svgIcon("assets/icons/Shop.svg", color: primaryColor),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Category.svg"),
                activeIcon:
                    svgIcon("assets/icons/Category.svg", color: primaryColor),
                label: "Discover",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Bookmark.svg"),
                activeIcon:
                    svgIcon("assets/icons/Bookmark.svg", color: primaryColor),
                label: "Bookmark",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Bag.svg"),
                activeIcon:
                    svgIcon("assets/icons/Bag.svg", color: primaryColor),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: svgIcon("assets/icons/Profile.svg"),
                activeIcon:
                    svgIcon("assets/icons/Profile.svg", color: primaryColor),
                label: "Profile",
              ),
            ]),
      ),

      /// End Bottom Navbar
    );
  }
}
