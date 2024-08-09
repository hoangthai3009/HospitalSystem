import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:giao_dien_app_benh_vien/components/bottom_nav_bar.dart';
import 'package:giao_dien_app_benh_vien/pages/home_page.dart';
import 'package:giao_dien_app_benh_vien/pages/login_page.dart';
import 'package:giao_dien_app_benh_vien/pages/guide_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const GuidePage(),
    const HomePage(),
    const LoginPage(),
  ];

  final List<String> _appBarTitles = [
    'Hướng dẫn',
    'Trang chủ',
    'Tài khoản',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.network('https://hoso.bvctch.vn/assets/img/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.home_filled, color: Colors.blue),
                title: const Text('Trang Chủ'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.policy, color: Colors.blue),
                title: const Text('Đ.Khoản & C.Sách'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/policy');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.blue),
                title: const Text('Giới Thiệu'),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/introduction');
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.brightness_6, color: Colors.blue),
              title: const Text('Chuyển Đổi Chế Độ'),
              trailing: Switch(
                value: AdaptiveTheme.of(context).mode.isDark,
                onChanged: (value) {
                  if (value) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => _onItemTapped(index),
      ),
    );
  }
}
