import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mts_app/core/color_path.dart';
import 'package:mts_app/src/common%20widgets/custom_appbar.dart';
import 'package:mts_app/src/controller/theme_controller.dart';
import 'package:mts_app/src/view/widget/custom.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:mts_app/src/common%20widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, double> dataMap = {
    "Sales": 30,
    "Operations": 30,
    "Canceled": 15,
    "Assigned": 10,
    "Carry": 10,
  };

  final Map<String, Color> colorMap = {
    "Sales": Color(0xFF3B82F6),
    "Operations": Color(0xFF10B981),
    "Canceled": Color(0xFFEF4444),
    "Assigned": Color(0xFFF59E0B),
    "Carry": Color(0xFF8B5CF6),
  };

  String selected = 'Operations';
  int totalProjects = 42;
  double performanceAmount = 2688;
  double percentOfTotal = 34;

  final List<Map<String, dynamic>> items = [
    {'title': 'Total Carry', 'amount': '\$740'},
    {'title': 'Total Assign', 'amount': '\$0'},
    {'title': 'Total Operation', 'amount': '\$0'},
    {'title': 'Total Cancelled', 'amount': '\$2240', 'color': Colors.red},
    {'title': 'Total Sales', 'amount': '\$2240'},
    {'title': 'Need to Assign', 'amount': '\$1200', 'color': Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(() {
      final isDark = themeController.isDark.value;
      return Scaffold(
        appBar: CustomAppBar(),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   'Welcome back\nSarah!.',
                      //   style: TextStyle(
                      //     fontSize: 27,
                      //     fontWeight: FontWeight.w700,
                      //     color:
                      //         isDark ? Colors.grey : Colors.blueGrey.shade900,
                      //   ),
                      // ),
                      // Text(
                      //   'Here\'s what\'s happening\nwith your project today.',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w400,
                      //     color: isDark ? Colors.grey : Color(0xff9ca3af),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      const StatCard(
                        icon: Icons.person_outline,
                        iconColor: Colors.blue,
                        title: 'Each Profiles',
                        value: '\$0',
                      ),
                      const SizedBox(height: 12),
                      const StatCard(
                        icon: Icons.insert_drive_file_outlined,
                        iconColor: Colors.green,
                        title: 'Projects',
                        value: '\$0',
                      ),
                      const SizedBox(height: 12),
                      const StatCard(
                        icon: Icons.show_chart,
                        iconColor: Colors.purple,
                        title: 'After Fiverr',
                        value: '\$0',
                      ),
                      const SizedBox(height: 12),
                      const StatCard(
                        icon: Icons.group_outlined,
                        iconColor: Colors.amber,
                        title: 'Bonus',
                        value: '\$0',
                      ),
                      const SizedBox(height: 23),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isDark ? Color(0xFF192034) : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  isDark
                                      ? Color(0xFF1A1D2E)
                                      : Colors.grey.shade300,
                              offset: Offset(3, 3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Project Distribution",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children:
                                    dataMap.keys.map((label) {
                                      final isSelected = selected == label;
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        child: ChoiceChip(
                                          label: Text(
                                            label,
                                            style: TextStyle(
                                              color:
                                                  isDark
                                                      ? isSelected
                                                          ? Colors.white
                                                          : Colors.white
                                                      : isSelected
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ),
                                          checkmarkColor:
                                              isDark
                                                  ? isSelected
                                                      ? Colors.white
                                                      : Colors.white
                                                  : isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                          selected: isSelected,
                                          selectedColor: colorMap[label]!
                                              .withOpacity(0.8),
                                          backgroundColor:
                                              isDark
                                                  ? Color(0xff11284A)
                                                  : const Color(0xFFf4f7fa),
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          onSelected: (_) {
                                            setState(() {
                                              selected = label;
                                            });
                                          },
                                        ),
                                      );
                                    }).toList(),
                              ),
                              const SizedBox(height: 16),
                              PieChart(
                                dataMap: dataMap,
                                colorList:
                                    dataMap.keys
                                        .map((key) => colorMap[key]!)
                                        .toList(),
                                chartType: ChartType.disc,
                                chartRadius:
                                    MediaQuery.of(context).size.width / 2.5,
                                legendOptions: const LegendOptions(
                                  showLegends: true,
                                  legendPosition: LegendPosition.bottom,
                                  showLegendsInRow: true,
                                  legendTextStyle: TextStyle(fontSize: 14),
                                ),
                                chartValuesOptions: const ChartValuesOptions(
                                  showChartValues: false,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color:
                                      isDark
                                          ? const Color(0xff15243F)
                                          : Color(0xfff8fafc),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Operations Performance",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color:
                                                    isDark
                                                        ? Colors.white
                                                        : Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              "Total projects: $totalProjects",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "\$${performanceAmount.toInt()}",
                                              style: const TextStyle(
                                                color: Color(0xFF10B981),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "$percentOfTotal% of total",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 23),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isDark ? AppColor.background : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  isDark
                                      ? Color(0xFF1A1D2E)
                                      : Colors.grey.shade300,
                              offset: Offset(3, 3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dashboard Status",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      isDark
                                          ? Color(0xFFFFFFFF)
                                          : Color(0xFF0F1729),
                                ),
                              ),
                              SizedBox(height: 20),
                              ...List.generate(items.length, (index) {
                                final item = items[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isDark
                                            ? const Color(0xff15243F)
                                            : Color(0xfff8fafc),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(0xFF9CA3AF),
                                        ),
                                      ),
                                      Text(
                                        item['amount'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: item['color'],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
