import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LookupPrescriptionsPage extends StatefulWidget {
  const LookupPrescriptionsPage({super.key});

  @override
  State<LookupPrescriptionsPage> createState() =>
      _LookupPrescriptionsPageState();
}

class _LookupPrescriptionsPageState extends State<LookupPrescriptionsPage> {
  final TextEditingController _profileIdController = TextEditingController();
  final TextEditingController _prescriptionNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tra Cứu Toa Thuốc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              'https://hoso.bvctch.vn/assets/img/draw/search.svg',
              height: 200,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _profileIdController,
              decoration: const InputDecoration(
                labelText: 'Mã Bệnh Nhân',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _prescriptionNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Số Toa Thuốc',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tra cứu'),
            ),
          ],
        ),
      ),
    );
  }
}
