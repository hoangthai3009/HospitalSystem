import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'health_insurance_page.dart';

import 'no_health_insurance_page.dart';

class MedicalExaminationInstructionsPage extends StatefulWidget {
  const MedicalExaminationInstructionsPage({super.key});

  @override
  State<MedicalExaminationInstructionsPage> createState() =>
      _MedicalExaminationInstructionsPageState();
}

class _MedicalExaminationInstructionsPageState
    extends State<MedicalExaminationInstructionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hướng Dẫn Khám Bệnh'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.network(
            'https://hoso.bvctch.vn/assets/img/draw/lead.svg',
            height: 200,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HealthInsurancePage()),
                );
              },
              child: const ListTile(
                leading: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                title: Text(
                  'Sử dụng BHYT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NoHealthInsurancePage()),
                );
              },
              child: const ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                title: Text(
                  'Không sử dụng BHYT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
