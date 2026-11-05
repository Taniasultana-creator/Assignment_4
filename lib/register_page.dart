
import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameRegex = RegExp(r'^[a-zA-Z ]{3,}$');
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final phoneRegex = RegExp(r'^(?:\+8801|01)[3-9]\d{8}$');
  final passwordRegex =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F1),
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00897B),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Card(
              color: Colors.white,
              elevation: 8,
              shadowColor: const Color(0xFF00897B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00897B),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Icon(
                          Icons.how_to_reg,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Join Us",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF004D40),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Fill in your details to sign up",
                        style: TextStyle(
                          color: Color(0xFF5F8D88),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 25),
                      InputField(
                        controller: nameController,
                        label: "Full Name",
                        prefixIcon: Icons.badge,
                        validator: (value) {
                          if (value == null ||
                              !nameRegex.hasMatch(value.trim())) {
                            return "Enter a valid name (at least 3 letters)";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        controller: emailController,
                        label: "Email",
                        prefixIcon: Icons.alternate_email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              !emailRegex.hasMatch(value.trim())) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        controller: phoneController,
                        label: "Phone Number",
                        prefixIcon: Icons.smartphone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null ||
                              !phoneRegex.hasMatch(value.trim())) {
                            return "Enter a valid BD phone number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        controller: passwordController,
                        label: "Password",
                        prefixIcon: Icons.vpn_key,
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              !passwordRegex.hasMatch(value)) {
                            return "8+ chars, uppercase, lowercase, number & symbol";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00897B),
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Registration validation successful!",
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already a member?",
                            style: TextStyle(
                              color: Color(0xFF5F8D88),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                color: Color(0xFF00897B),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}