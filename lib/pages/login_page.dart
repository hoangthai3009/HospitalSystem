import 'package:flutter/material.dart';
import 'package:giao_dien_app_benh_vien/models/history.dart';
import 'package:giao_dien_app_benh_vien/services/booking_service.dart';
import 'package:giao_dien_app_benh_vien/pages/booking_list_page.dart';
import 'package:giao_dien_app_benh_vien/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _profileIdController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<List<History>> fetchData() async {
    try {
      List<History> historyList = await BookingService().getHistoryBooking(
        _profileIdController.text,
        _phoneNumberController.text,
      );
      return historyList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myTextField(
              _profileIdController,
              'Mã Hồ Sơ',
            ),
            myTextField(
              _phoneNumberController,
              'SĐT',
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                List<History> historyList = await fetchData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookingListPage(historyList: historyList),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                padding: const EdgeInsets.all(20),
              ),
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ),
              label: const Text(
                'Đăng nhập',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
