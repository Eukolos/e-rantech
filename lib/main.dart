import 'package:erantech/src/app.dart';
import 'package:erantech/src/constants/theme_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Rantech',
      theme: ThemeConfig.createTheme(),
      debugShowCheckedModeBanner: false,
      home: const Rantech(title: 'e-Rantech'),
    );
  }
}

