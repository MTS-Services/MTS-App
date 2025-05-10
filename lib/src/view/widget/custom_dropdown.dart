import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mts_app/core/color_path.dart';
import '../../../core/responsive_size.dart';
import '../../controller/theme_controller.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveSizes.init(context);
    final themeController = Get.put(ThemeController());
    return Obx(() {
      final isDark = themeController.isDark.value;
      return DropdownButton2<String>(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: ResponsiveSizes.fontMedium,
            color: isDark ? Colors.white : Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        value: items.contains(selectedValue) ? selectedValue : null,
        items:
            items
                .toSet()
                .map(
                  (item) => DropdownMenuItem<String>(
                    alignment: Alignment.centerLeft,
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: ResponsiveSizes.fontSmall,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          height: ResponsiveSizes.blockHeight * 6,
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveSizes.paddingMedium,
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColor.salesComment : AppColor.amountText,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.blueGrey.shade700 : AppColor.borderColor,
              width: 1.5,
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: ResponsiveSizes.blockHeight * 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isDark ? AppColor.salesComment : AppColor.amountText,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: ResponsiveSizes.blockHeight * 5,
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveSizes.paddingMedium,
          ),
        ),
      );
    });
  }
}
