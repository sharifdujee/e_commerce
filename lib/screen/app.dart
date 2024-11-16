import 'package:e_commerce_admin_panel/common/binding/general_binding.dart';
import 'package:e_commerce_admin_panel/common/rounded_container.dart';
import 'package:e_commerce_admin_panel/common/widget/layout/templates/site_layout.dart';
import 'package:e_commerce_admin_panel/routes/app_route.dart';
import 'package:e_commerce_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/theme/theme.dart';


class App extends StatelessWidget {
  App({super.key});

  // Define a single GlobalKey for the navigator
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey, // Use the navigatorKey here
      title: 'Admin Panel',
      initialBinding: GeneralBinding(),
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppRoute.pages,
      initialRoute: TRoutes.dashboard,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => const Scaffold(body: Center(child: Text('Page Not Found'))),
      ),
      //home: const DashboardScreen(),
    );
  }
}




class ResponsiveDesign extends StatelessWidget {
  const ResponsiveDesign({super.key});
  static const responseDesign = '/responsive-design';

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: Desktop(), mobile: Mobile(),);
  }
}




class Desktop extends StatelessWidget {
  const Desktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap with SingleChildScrollView
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: TRoundedContainer(
                  height: 450,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  child: const Center(child: Text('Box 1')),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  TRoundedContainer(
                    height: 200,
                    width: 400,
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    child: const Center(child: Text('Box 2')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: TRoundedContainer(
                          backgroundColor: Colors.red.withOpacity(0.2),
                          height: 100,
                          width: 200,
                          child: const Center(child: Text('Box 3')),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Flexible(
                        fit: FlexFit.loose,
                        child: TRoundedContainer(
                          backgroundColor: Colors.red.withOpacity(0.2),
                          height: 100,
                          width: 200,
                          child: const Center(child: Text('Box 4')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: TRoundedContainer(
                  height: 190,
                  backgroundColor: Colors.red.withOpacity(0.2),
                  child: const Center(child: Text('Box 5')),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: TRoundedContainer(
                  backgroundColor: Colors.red.withOpacity(0.2),
                  height: 190,
                  child: const Center(child: Text('Box 6')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}






class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap the entire content in a SingleChildScrollView for scrolling
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TRoundedContainer(
                    height: 450,
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    child: const Center(child: Text('Box 1')),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    TRoundedContainer(
                      height: 200,
                      width: 250, // Set width to prevent infinite constraint error
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      child: const Center(child: Text('Box 2')),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        TRoundedContainer(
                          backgroundColor: Colors.red.withOpacity(0.2),
                          height: 190,
                          width: 150, // Set width to prevent infinite constraint error
                          child: const Center(child: Text('Box 3')),
                        ),
                        const SizedBox(width: 10),
                        TRoundedContainer(
                          backgroundColor: Colors.red.withOpacity(0.2),
                          height: 190,
                          width: 150, // Set width to prevent infinite constraint error
                          child: const Center(child: Text('Box 4')),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TRoundedContainer(
                  height: 190,
                  backgroundColor: Colors.red.withOpacity(0.2),
                  child: const Center(child: Text('Box 5')),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TRoundedContainer(
                  height: 190,
                  backgroundColor: Colors.red.withOpacity(0.2),
                  child: const Center(child: Text('Box 6')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap in SingleChildScrollView for vertical scrolling
      child: Column(
        children: [
          TRoundedContainer(
            height: 450,
            backgroundColor: Colors.blue.withOpacity(0.2),
            child: const Center(child: Text('Box 1')),
          ),
          const SizedBox(height: 20),
          TRoundedContainer(
            height: 200,
            backgroundColor: Colors.blue.withOpacity(0.2),
            child: const Center(child: Text('Box 2')),
          ),
          const SizedBox(height: 20),
          TRoundedContainer(
            height: 190,
            backgroundColor: Colors.red.withOpacity(0.2),
            child: const Center(child: Text('Box 3')),
          ),
          const SizedBox(height: 10),
          TRoundedContainer(
            height: 190,
            backgroundColor: Colors.red.withOpacity(0.2),
            child: const Center(child: Text('Box 4')),
          ),
          const SizedBox(height: 20),
          TRoundedContainer(
            height: 190,
            backgroundColor: Colors.red.withOpacity(0.2),
            child: const Center(child: Text('Box 5')),
          ),
          const SizedBox(height: 20),
          TRoundedContainer(
            height: 190,
            backgroundColor: Colors.red.withOpacity(0.2),
            child: const Center(child: Text('Box 6')),
          ),
        ],
      ),
    );
  }
}







