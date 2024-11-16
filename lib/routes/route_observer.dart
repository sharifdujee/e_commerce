
import 'package:e_commerce_admin_panel/common/widget/layout/sidebar/controller/sidebar_contrller.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RouteObserver extends GetObserver{


  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SideBarController());

    if(previousRoute != null){
      for(var routeName in TRoutes.sideMenuItems){
        if(previousRoute.settings.name == routeName){
          sidebarController.activeItem.value = routeName;
        };

      }
    }

  }

  @override
  void didPush(Route <dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SideBarController());
    if(route != null){
      for(var routeName in TRoutes.sideMenuItems){
        if(route.settings.name == routeName){
          sidebarController.activeItem.value = routeName;

        }
      }
    }


  }
}