import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:mts_app/src/controller/theme_controller.dart';
import 'package:mts_app/src/view/screen/home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final themeController = Get.put(ThemeController());

    return Obx(() {
      final isDark = themeController.isDark.value;

      return Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (value) => controller.selectedIndex.value = value,
          backgroundColor: isDark ? const Color(0xff11284a) : Color(0xfff1f5f9),
          indicatorColor: isDark ? Colors.black26 : Colors.grey[300],
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: Colors.grey),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.task_square, color: Colors.grey),
              label: 'Projects',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.notification, color: Colors.grey),
              label: 'Alerts',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user, color: Colors.grey),
              label: 'Account',
            ),
          ],
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      );
    });
  }
}

class NavigationController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.blueAccent),
    Container(color: Colors.yellow),
  ];
}
