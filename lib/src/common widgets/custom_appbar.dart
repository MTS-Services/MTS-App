import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mts_app/core/image_path.dart';
import 'package:mts_app/src/controller/theme_controller.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = controller.isDark.value;

      return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              splashRadius: 40,
              icon: const Icon(
                Iconsax.textalign_left5,
                size: 27,
                color: Colors.grey,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            Transform.translate(
              offset: Offset(-22, 0),
              child: Image.asset(
                isDark ? ImagePath.appLogoLight : ImagePath.appLogoDark,
                height: 100, // Adjust size as needed
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor:
                isDark ? const Color(0xff11284a) : Colors.grey[200],
            child: IconButton(
              icon: Icon(
                isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                color: isDark ? Colors.amber : Colors.grey,
              ),
              onPressed: () {
                controller.toggleTheme(!isDark);
              },
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor:
                isDark ? const Color(0xff11284a) : Colors.grey[200],
            child: const Icon(Iconsax.notification, color: Colors.grey),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: ClipOval(
              child: Image(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000',
                ),
                fit: BoxFit.cover,
                height: 36,
                width: 36,
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      );
    });
  }
}
