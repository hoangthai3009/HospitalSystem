import 'package:flutter/material.dart';

class NoHealthInsurancePage extends StatelessWidget {
  const NoHealthInsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Không sử dụng BHYT'),
      ),
      body: ListView(
        children: [
          Image.network(
              'https://hoso.bvctch.vn/assets/img/guide/khongBHYT.jpg'),
        ],
      ),
    );
  }
}
