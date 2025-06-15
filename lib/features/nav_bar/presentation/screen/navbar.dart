
import 'package:business_app/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/common/widget/custom_text.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../../controller/navbar_controller.dart';
import '../widget/bottom_navbar_clipper.dart';
import '../widget/floating_pop_up_dialog.dart';


class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});
  static const String routeName = "/navBar";

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavbarController());
    final isEditionMode = false.obs; // Reactive FAB icon state

    return Scaffold(
      body: Obx(() => navController.pages[navController.currentIndex.value]),
      floatingActionButton: Obx(() => GestureDetector(
        onTap: () {
          isEditionMode.value = !isEditionMode.value;
          floatingPopupDialog(context);
          HapticFeedback.mediumImpact();  // Haptic feedback for floating action button
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, -15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 88.h),
                    child: Image.asset(
                      /// change later
                      isEditionMode.value
                          ? IconPath.profile
                          : IconPath.profile,
                      width: 120.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 44.h),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  if (isEditionMode.value)
                    Positioned(
                        bottom: 10,
                        left: 40,
                        child: const Icon(Icons.arrow_drop_up,
                            size: 18, color: Color(0xff20B1D1))),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        navController: navController,
        isEditionMode: isEditionMode,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final NavbarController navController;
  final RxBool isEditionMode;

  const CustomBottomNavBar({super.key, required this.navController, required this.isEditionMode});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            border: Border.all(
              width: 1.w,
              color: const Color(0xffF5F5F5),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16.3,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: ClipPath(
            clipper: BottomNavBarClipper(),
            child: SizedBox(
              height: 106, // Reduced height from 115 to 80
              child: Obx(
                    () => BottomNavigationBar(
                  currentIndex: navController.currentIndex.value,
                  onTap: (index) {
                    if (index > 1) index -= 1;
                    isEditionMode.value = false;
                    navController.changePage(index);
                    HapticFeedback.mediumImpact();  // Haptic feedback for bottom nav bar buttons
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: const Color(0xff20B1D1),
                  unselectedItemColor: const Color(0xff8E8E8E),
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: [
                    _buildNavItem(
                        icon: IconPath.home,
                        label: 'Home',
                        isSelected: navController.currentIndex.value == 0),
                    _buildNavItem(
                        icon: IconPath.favorite,
                        label: 'Favorite',
                        isSelected: navController.currentIndex.value == 1),
                    const BottomNavigationBarItem(icon: SizedBox(), label: ""),
                    // Empty slot for FAB
                    _buildNavItem(
                        icon: IconPath.cart,
                        label: 'Cart',
                        isSelected: navController.currentIndex.value == 2),
                    _buildNavItem(
                        icon: IconPath.profile,
                        label: 'Profile',
                        isSelected: navController.currentIndex.value == 3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem({required String icon, required String label, required bool isSelected}) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Image.asset(
            icon,
            height: 18,
            width: 18,
            color: isSelected ? const Color(0xff20B1D1) : const Color(0xff8E8E8E),
          ),
          SizedBox(height: 5),  // Adjusted spacing between icon and label
          CustomText(
            text: label,
            fontSize: 11.w,
            fontWeight: FontWeight.w400,
            color: isSelected ? const Color(0xff20B1D1) : const Color(0xff8E8E8E),
          ),
          // if (isSelected)
          //   Icon(Icons.arrow_drop_up, size: 18, color: AppColors.primary),
        ],
      ),
      label: '',
    );
  }
}

