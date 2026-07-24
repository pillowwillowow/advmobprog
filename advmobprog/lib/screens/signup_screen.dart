import 'package:flutter/material.dart';
import '../widgets/constants.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void register() {

    if (_formKey.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created successfully!"),
        ),
      );

      Navigator.pop(context);

    }

  }

  @override
  Widget build(BuildContext context) {

  AppBar appBar = AppBar(
    centerTitle: true,

    backgroundColor: YF_DARK,

    elevation: 0,

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),

    title: Text(
      "Create Account",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Frutiger',
        color: YF_SECONDARY,
      ),
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

return Scaffold(
  appBar: appBar,
  body: SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(30),

      child: Form(
        key: _formKey,

        child: Column(
          children: [

                TextFormField(
                  controller: usernameController,

                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) =>
                      value!.isEmpty ? "Enter username" : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: emailController,

                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) =>
                      value!.isEmpty ? "Enter email" : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,

                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {
                    if (value!.length < 6) {
                      return "Minimum of 6 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: confirmController,
                  obscureText: obscurePassword,

                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  validator: (value) {
                    if (value != passwordController.text) {
                      return "Passwords do not match";
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

                    onPressed: register,

                    child: const Text("REGISTER"),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(

                  onPressed: () {

                    Navigator.pop(context);

                  },

                  child: const Text("Already have an account? Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}