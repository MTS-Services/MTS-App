import 'package:flutter/material.dart';
import 'package:mts_app/core/color_path.dart';
import 'package:mts_app/core/responsive_size.dart';
import 'package:mts_app/src/view/widget/custom_button.dart';
import 'package:mts_app/src/view/widget/custom_dropdown.dart';
import 'package:mts_app/src/view/widget/order_card.dart';
import 'package:mts_app/src/view/widget/customTextRow.dart';
import 'package:mts_app/src/view/widget/custom_text_formField.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  String? selectedItem;
  List<String> myItems = ['Option 1', 'Option 2', 'Option 3'];
  List<String> departments = ['Flutter', 'MERN', 'Laravel'];

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ResponsiveSizes.init(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.background,
        title: Row(
          children: [
            CircleAvatar(
              radius: ResponsiveSizes.avatarRadiusSmall,
              backgroundColor: Colors.white,
            ),
            SizedBox(width: ResponsiveSizes.paddingMedium),
            Text(
              "MTS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveSizes.fontLarge,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveSizes.paddingSmall * 2,
                vertical: ResponsiveSizes.paddingSmall * 2,
              ),
              width: ResponsiveSizes.blockWidth * 90,
              margin: EdgeInsets.all(ResponsiveSizes.paddingMedium),
              decoration: BoxDecoration(
                color: AppColor.background,
                borderRadius: BorderRadius.circular(ResponsiveSizes.blockWidth * 3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Project"),
                  _buildSearchField(),
                  SizedBox(height: ResponsiveSizes.paddingMedium),
                  _buildCustomDropdowns(),
                  CustomButton(text: "Reset Filter", onPressed: () {}),
                  SizedBox(height: ResponsiveSizes.paddingLarge),
                  _buildOrderCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: ResponsiveSizes.fontMedium,
        fontWeight: FontWeight.bold,
        color: AppColor.amountText,
      ),
    );
  }

  Widget _buildSearchField() {
    return Column(
      children: [
        SizedBox(height: ResponsiveSizes.paddingMedium),
        CustomTextFormField(
          controller: _controller,
          hintText: "Enter your text",
          prefixIcon: Icons.search,
          suffixIcon: Icons.clear,
          onTapSuffixIcon: () {
            _controller.clear();
          },
        ),
      ],
    );
  }

  Widget _buildCustomDropdowns() {
    return Column(
      children: List.generate(4, (index) {
        return Column(
          children: [
            SizedBox(
              height: ResponsiveSizes.blockHeight * 6,
              child: CustomDropdown(
                items: myItems,
                selectedValue: selectedItem,
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
              ),
            ),
            SizedBox(height: ResponsiveSizes.paddingMedium),
          ],
        );
      }),
    );
  }

  Widget _buildOrderCard() {
    return OrderCard(
      name: "Name",
      orderId: "#ORD-2023-001",
      price: "\$1200.00/\$960.00",
      child: Column(
        children: [
          CustomTextRow(title: 'Department/Team', value: 'ON/OB'),
          SizedBox(height: ResponsiveSizes.paddingMedium),
          _buildDepartmentDropdownRow(),
          SizedBox(height: ResponsiveSizes.paddingMedium),
          CustomTextRow(title: 'OP status', value: 'As status'),
          SizedBox(height: ResponsiveSizes.paddingSmall),
          _buildDepartmentDropdownRow(),
          SizedBox(height: ResponsiveSizes.paddingSmall),
          _buildCommentsSection(),
        ],
      ),
    );
  }

  Widget _buildDepartmentDropdownRow() {
    return Row(
      children: [
        Expanded(
          child: CustomDropdown(
            items: departments,
            selectedValue: selectedItem,
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
          ),
        ),
        SizedBox(width: ResponsiveSizes.paddingSmall),
        Expanded(
          child: CustomDropdown(
            items: departments,
            selectedValue: selectedItem,
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCommentsSection() {
    return Column(
      children: [
        CustomTextRow(title: 'Sales Comments'),
        SizedBox(height: ResponsiveSizes.paddingSmall),
        CustomTextFormField(
          controller: _commentController,
          hintText: "Comments",
          maxLines: 3,
        ),
        SizedBox(height: ResponsiveSizes.paddingSmall),
        CustomTextRow(title: 'OPs Comments'),
        CustomTextFormField(
          controller: _commentController,
          hintText: "Ops Comments",
          maxLines: 3,
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
