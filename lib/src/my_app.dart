import 'package:flutter/material.dart';

import '../src/features/home/presentation/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Home Page',),
    );
  }
}
