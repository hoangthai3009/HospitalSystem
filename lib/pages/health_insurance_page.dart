import 'package:flutter/material.dart';

class HealthInsurancePage extends StatelessWidget {
  const HealthInsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dịch vụ Bảo Hiểm Sức Khỏe'),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://hoso.bvctch.vn/assets/img/guide/coBHYT.jpg',
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Địa Điểm Khám: Phòng Khám 29',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Vui lòng chuẩn bị sẵn giấy chuyển tuyến, CMND/CCCD và Thẻ Bảo Hiểm Y Tế',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Xem Chỉ Đường'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
