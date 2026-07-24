import 'package:flutter/material.dart';
import 'package:pinspiration/widgets/constants.dart';
import '../widgets/grid.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg",
    "assets/images/img7.jpg",
    "assets/images/img8.jpg",
    "assets/images/img9.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.white,

      selectedItemColor: YF_PRIMARY,
      unselectedItemColor: Colors.black,

      currentIndex: 0,

      showSelectedLabels: false,
      showUnselectedLabels: false,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 30),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, size: 30),
          label: "Add",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, size: 30),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: 30),
          label: "Profile",
        ),
      ],
    ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Suggested Images",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Frutiger',
                ),
              ),

              const SizedBox(height: 15),

              MasonryGrid(
                images: images,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}