import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    )..repeat(reverse: true);


    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.popAndPushNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

Widget _buildDot(int index) {
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      double progress = (_controller.value + index * 0.2) % 1.0;

      // Bigger pulse
      double scale = 0.6 + 0.8 * (1 - (progress - 0.5).abs() * 2);

        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
          color: YF_DARK,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

//Enhancement 2: Created my own Animated Loading (DONE)

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: YF_WHITE,
        body: Stack(
          children: [

            // Top container
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  color: YF_SECONDARY,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
              ),
            ),

            // Bottom container
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  color: YF_SECONDARY,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
              ),
            ),

            // Centered logo
            Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/logo.png', 
                  width: 300.w,
                ),
              ),
            ),

            // Loading dots near the bottom
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/loading.png',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Row(
                    children: List.generate(5, (index) => _buildDot(index)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
    