import 'package:flutter/material.dart';
import 'package:mts_app/core/color_path.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({super.key});

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  bool showPassword = false;

  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [Tab(text: 'Sign In'), Tab(text: 'Register')],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(

            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(20)

            ),
            child: TabBarView(
              children: [
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      const Text(
                        "Welcome back",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Enter Your credentials to access your account",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.fontGreyColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: 16),

                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),

                      SizedBox(height: 12),

                      TextFormField(
                        obscureText: !showPassword,

                        decoration: InputDecoration(
                          labelText: 'Password',

                          prefixIcon: const Icon(Icons.lock),

                          suffixIcon: IconButton(
                            icon: Icon(
                              showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),

                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (_) {}),
                              const Text("Remember me"),
                            ],
                          ),

                          TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      ElevatedButton.icon(
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            // Handle login
                          }
                        },

                        icon: const Icon(Icons.login),
                        label: const Text("Sign In"),
                      ),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  padding: EdgeInsets.all(20),

                  child: Form(
                    key: _registerFormKey,

                    child: Column(
                      children: [
                        Text(
                          "Create an Account",

                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),

                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'First Name',
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Last Name'),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Permanent Address',
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Present Address',
                          ),
                        ),

                        const SizedBox(height: 8),

                        DropdownButtonFormField(
                          decoration: const InputDecoration(labelText: 'Gender'),

                          items: const [
                            DropdownMenuItem(value: 'male', child: Text("Male")),

                            DropdownMenuItem(
                              value: 'female',
                              child: Text("Female"),
                            ),
                          ],

                          onChanged: (_) {},
                        ),

                        const SizedBox(height: 8),

                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            labelText: 'Blood Group',
                          ),

                          items: const [
                            DropdownMenuItem(value: 'A+', child: Text("A+")),

                            DropdownMenuItem(value: 'B+', child: Text("B+")),

                            DropdownMenuItem(value: 'O+', child: Text("O+")),
                          ],

                          onChanged: (_) {},
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Guardian Relation',
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Guardian Number',
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Guardian Address',
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Education'),
                        ),

                        const SizedBox(height: 8),

                        TextFormField(
                          obscureText: !showPassword,

                          decoration: InputDecoration(
                            labelText: 'Password',

                            suffixIcon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),

                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        ElevatedButton.icon(
                          onPressed: () {
                            if (_registerFormKey.currentState!.validate()) {
                              // Handle registration
                            }
                          },

                          icon: const Icon(Icons.person_add),

                          label: const Text("Register"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
