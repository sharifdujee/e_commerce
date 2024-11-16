import 'package:e_commerce_admin_panel/features/feature_authentication/repositories/authentication_repository.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TRouteMiddleWare extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route){
    return AuthenticationRepository.instance.isAuthenticated?const RouteSettings(name: TRoutes.dashboard): const RouteSettings(name: TRoutes.loginScreen);

  }

}