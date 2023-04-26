import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController(), fenix: true);
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: FilledButton(
            child: const Text('Go see page'),
            onPressed: () => Get.to(() => const HomePage()),
          ),
        ),
      ),
    );
  }
}
