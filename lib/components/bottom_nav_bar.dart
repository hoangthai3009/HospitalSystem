import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GNav(
        color: Colors.blue[400],
        activeColor: Colors.blue[700],
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.blue[100]!,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        onTabChange: (value) => onTabChange!(value),
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.menu_book,
            text: "Hướng Dẫn",
          ),
          GButton(
            icon: Icons.home_filled,
            text: "Trang Chủ",
          ),
          GButton(
            icon: Icons.person,
            text: "Đăng Nhập",
          ),
        ],
        selectedIndex: 1,
      ),
    );
  }
}
