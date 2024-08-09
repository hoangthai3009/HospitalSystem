import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SvgPicture.network(
              'https://hoso.bvctch.vn/assets/img/draw/home.svg',
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildCardItem(
                    '/booking',
                    Icons.add,
                    'ĐĂNG KÝ KHÁM BỆNH',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildCardItem(
                    '/lookupPrescriptions',
                    Icons.find_in_page,
                    'TRA CỨU TOA THUỐC',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildCardItem(
                    '/medicalExaminationInstructions',
                    Icons.info,
                    'HƯỚNG DẪN KHÁM BỆNH',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildCardItem(
                    '/map',
                    Icons.map_outlined,
                    'BẢN ĐỒ',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(String routeName, IconData iconData, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 8,
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 50,
              color: Colors.blue[800],
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
