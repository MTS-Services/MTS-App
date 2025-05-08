import 'package:flutter/material.dart';
import 'package:mts_app/src/common%20widgets/custom_appbar.dart';
import 'package:mts_app/src/view/widget/custom.dart';
import 'package:mts_app/src/common%20widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                StatCard(
                  icon: Icons.person_outline,
                  iconColor: Colors.blue,
                  title: 'Each Profiles',
                  value: '\$0',
                ),
                SizedBox(height: 12),
                StatCard(
                  icon: Icons.insert_drive_file_outlined,
                  iconColor: Colors.green,
                  title: 'Projects',
                  value: '\$0',
                ),
                SizedBox(height: 12),
                StatCard(
                  icon: Icons.show_chart,
                  iconColor: Colors.purple,
                  title: 'After Fiverr',
                  value: '\$0',
                ),
                SizedBox(height: 12),
                StatCard(
                  icon: Icons.group_outlined,
                  iconColor: Colors.amber,
                  title: 'Bonus',
                  value: '\$0',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
