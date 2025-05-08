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
        foregroundColor: Colors.white,
        title: Image(
          height: 100,
          image: AssetImage(
            isDark ? ImagePath.appLogoLight : ImagePath.appLogoDark,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
              color: isDark ? Colors.amber : Colors.grey,
            ),
            onPressed: () {
              controller.toggleTheme(!isDark);
            },
          ),
          IconButton(
            icon: Icon(Iconsax.notification, color: Colors.grey),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                  fit: BoxFit.cover,
                  height: 36,
                  width: 36,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
        titleSpacing: 0,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Icon(Iconsax.textalign_left5, color: Colors.grey),
            );
          },
        ),
      );
    });
  }
}
