import 'package:flutter/material.dart';
import 'package:pinspiration/widgets/constants.dart';

import 'home_screen.dart';
import 'signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {

    if (_formKey.currentState!.validate()) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(30),

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const SizedBox(height: 10),

               Image.asset(
              'assets/images/logogo.png',
              height: 150.h,
            ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,

                  decoration: InputDecoration(
                    labelText: "Password",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: YF_DARK,
                      foregroundColor: Colors.white,
                    ),

                    onPressed: login,

                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/guest.png', 
                        width: 30,
                        height: 30,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "Continue as Guest",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Frutiger',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    const Text("Don't have an account?"),

                    TextButton(

                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );

                      },

                      child: const Text("Register Here"),
                    )

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}