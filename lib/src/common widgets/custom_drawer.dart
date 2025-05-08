import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mts_app/core/image_path.dart';
import 'package:mts_app/src/controller/theme_controller.dart';
import 'package:mts_app/src/view/screen/home_screen.dart';
import 'package:mts_app/src/common%20widgets/custom_drawer_icons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    final isDark = controller.isDark.value;
    return Drawer(
      backgroundColor: isDark ? Color(0xff0f1729) : Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xff11284a) : Color(0xfff1f5f9),
            ),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                isDark ? ImagePath.appLogoLight : ImagePath.appLogoDark,
              ),
            ),
          ),
          CustomDrawerIcon(
            title: 'Home',
            icon: Icon(Iconsax.home),
            onTap: () {
              Get.to(() => HomeScreen());
            },
          ),
          CustomDrawerIcon(
            title: 'Projects',
            icon: Icon(Iconsax.activity),
            onTap: () {
              Get.to(() {});
            },
          ),
          CustomDrawerIcon(
            title: 'Today\'s Task',
            icon: Icon(Iconsax.task_square),
            onTap: () {},
          ),
          CustomDrawerIcon(
            title: 'Performance',
            icon: Icon(Iconsax.trend_up),
            onTap: () {
              Get.to(() {});
            },
          ),
          CustomDrawerIcon(
            title: 'User Profile',
            icon: Icon(Iconsax.profile_circle),
            onTap: () {
              Get.to(() {});
            },
          ),
        ],
      ),
    );
  }
}
