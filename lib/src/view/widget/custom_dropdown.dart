import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mts_app/core/color_path.dart';
import '../../../core/responsive_size.dart';

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

    return DropdownButton2<String>(
      isExpanded: true,
      underline: const SizedBox.shrink(),
      hint: Text(
        'Select Item',
        style: TextStyle(
          fontSize: ResponsiveSizes.fontSmall,
          color: AppColor.amountText,
        ),
      ),
      value: items.contains(selectedValue) ? selectedValue : null,
      items: items.toSet().map(
            (item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: ResponsiveSizes.fontSmall,
              color: AppColor.amountText,
            ),
          ),
        ),
      ).toList(),
      onChanged: onChanged,
      buttonStyleData: ButtonStyleData(
        height: ResponsiveSizes.blockHeight * 6,
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveSizes.paddingMedium,
        ),
        decoration: BoxDecoration(
          color: AppColor.salesComment,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blueGrey.shade300, width: 1.5),
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: ResponsiveSizes.blockHeight * 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.salesComment,
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        height: ResponsiveSizes.blockHeight * 5,
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveSizes.paddingMedium,
        ),
      ),
    );
  }
}
