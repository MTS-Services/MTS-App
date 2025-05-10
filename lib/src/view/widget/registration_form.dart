import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color_path.dart';
import '../../controller/theme_controller.dart';
import 'custom_dropdown.dart';
import 'custom_textfield.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genderList = [
      'Male', 'Female'
    ];
    final List<String> bloodGroupList = [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-',
    ];
    final List<String> relationshipStatusList = [
      'Single',
      'In a Relationship',
      'Engaged',
      'Married',
      'Separated',
      'Divorced',
      'Widowed',
    ];
    final List<String> departmentList = [
      'Plugin',
      'MERN',
      'Flutter',
      'Laravel',
      'Sales'
    ];
    final List<String> religionList = [
      'Islam',
      'Christianity',
      'Hinduism',
      'Buddhism',
      'Other',
    ];

    final themeController = Get.put(ThemeController());
    return Obx(() {
      final isDark = themeController.isDark.value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Create an Account',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Fill in your information to get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: isDark ? Colors.white : AppColor.fontGreyColor),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
          const Text('First Name', style: TextStyle(fontWeight: FontWeight.w500)),
          CustomTextField(),
          const Text('Last Name', style: TextStyle(fontWeight: FontWeight.w500)),
          CustomTextField(),
          const Text('Email', style: TextStyle(fontWeight: FontWeight.w500)),
          CustomTextField(),
          const Text(
              'Phone Number', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomTextField(),
          const Text(
              'Permanent Address', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomTextField(),
          const Text(
              'Present Address', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomTextField(),
          const Text(
              'Gender', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomDropdownButton(itemList: genderList, listType: 'Select Gender'),
          const Text(
              'Blood Group', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomDropdownButton(itemList: bloodGroupList, listType: 'Select Blood Group'),
          const Text(
              'Relationship Status', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomDropdownButton(itemList: relationshipStatusList, listType: 'Select :Relationship'),
          const Text(
              'Department', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomDropdownButton(itemList: departmentList, listType: 'Select Department'),
          const Text(
              'Religion', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomDropdownButton(itemList: religionList, listType: 'Select Religion'),
          const Text(
              'Guardian Relation', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomTextField(),
          const Text(
              'Education', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomTextField(),
          const Text(
              'Password', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomTextField(suffixIcon: Icon(Icons.remove_red_eye_outlined),),
          const Text(
              'Confirm Password', style: TextStyle(fontWeight: FontWeight.w500)
          ),
          CustomTextField(suffixIcon: Icon(Icons.remove_red_eye_outlined),),
        ],
      ),
    );
    });
  }
}
