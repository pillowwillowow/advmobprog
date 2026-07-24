import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PinspirationApp());
}

class PinspirationApp extends StatelessWidget {
  const PinspirationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852), // Use your design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PinIt',

          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.red,
          ),

          initialRoute: '/',

          routes: {
            '/': (_) => const SplashScreen(),
            '/login': (_) => const LoginScreen(),
            '/signup': (_) => const SignupScreen(),
            '/home': (_) => const HomeScreen(),
          },
        );
      },
    );
  }
}