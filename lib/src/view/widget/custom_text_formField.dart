import 'package:flutter/material.dart';
import 'package:mts_app/core/color_path.dart';
import 'package:mts_app/core/responsive_size.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.maxLines = 1,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      style: const TextStyle(
        color: Colors.white,
      ),
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.salesComment,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.7),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Colors.white)
            : null,
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
          onTap: widget.onTapSuffixIcon,
          child: Icon(widget.suffixIcon, color: Colors.white),
        )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: ResponsiveSizes.blockHeight * 1.5,
          horizontal: ResponsiveSizes.paddingMedium,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
