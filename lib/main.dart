import 'package:flutter/material.dart';
import 'package:jokenpo/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'JokenPo';

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: MyHomePage(title: title),
    );
  }
}
