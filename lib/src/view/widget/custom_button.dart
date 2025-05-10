import 'package:flutter/material.dart';
import 'package:mts_app/core/color_path.dart';
import '../../../core/responsive_size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveSizes.init(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.salesComment,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(
          vertical: ResponsiveSizes.blockHeight * 1.5,
          horizontal: ResponsiveSizes.paddingMedium,
        ),
        textStyle: TextStyle(
          fontSize: ResponsiveSizes.fontMedium,
        ),
      ),
      child: Text(text),
    );
  }
}
