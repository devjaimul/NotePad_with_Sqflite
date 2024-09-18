import 'package:flutter/material.dart';
import 'package:notepad/views/add_screen/add_screen.dart';
import 'package:notepad/views/profile_screen/profile_screen.dart';
import '../../utlis/colors.dart';
import '../home_screen.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  List<Widget> screen=[
    const HomeScreen(),
   AddScreen(),
    ProfileScreen()


  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedItemColor: Colors.black.withOpacity(0.6),
          showUnselectedLabels: true,
          // showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.add),
                icon: Icon(Icons.add),
                label: "Add"),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.person),
                icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}