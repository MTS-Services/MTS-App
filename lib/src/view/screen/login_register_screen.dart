import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mts_app/core/color_path.dart';
import '../../controller/theme_controller.dart';
import '../widget/login_form.dart';
import '../widget/registration_form.dart';
class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});
  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx((){
      final isDark = themeController.isDark.value;
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50,
                  ),
                  Container(//i need shadow on this container
                    width: 370,
                    decoration: BoxDecoration(
                      color: isDark ? AppColor.salesComment : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isDark ? Colors.white : AppColor.buttonBackgroundColor,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                    onTap: () => setState(() => isLogin = true),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      decoration: BoxDecoration(
                                        color: isDark ? (isLogin ?  AppColor.background : Colors.white) : (isLogin ?  Colors.white : AppColor.buttonBackgroundColor),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: isDark ? (isLogin ? Colors.white : Colors.black) : (isLogin ? Colors.black : AppColor.fontGreyColor),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                    onTap: () => setState(() => isLogin = false),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      decoration: BoxDecoration(
                                        color:
                                        isDark ? (isLogin ? Colors.white : AppColor.background) : (isLogin ? AppColor.buttonBackgroundColor : Colors.white),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                          color: isDark ? (isLogin ? Colors.black : Colors.white) : (isLogin ? AppColor.fontGreyColor : Colors.black),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: Column(
                            children: [
                              isLogin ? const LoginForm() : const RegisterForm(),
                              const SizedBox(height: 20),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue,
                                  minimumSize: const Size(double.infinity, 48),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.login,color: Colors.white,),
                                label: Text(isLogin ? 'Sign In' : 'Register', style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}