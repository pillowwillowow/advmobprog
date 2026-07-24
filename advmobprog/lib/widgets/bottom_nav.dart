import 'package:flutter/material.dart';
import 'constants.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,

      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.white,

      selectedItemColor: YF_DARK,
      unselectedItemColor: Colors.grey,

      showSelectedLabels: false,
      showUnselectedLabels: false,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "",
        ),
      ],
    );
  }
}