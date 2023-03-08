import 'package:flutter/material.dart';
import 'package:jokenpo/screens/jogo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JokenPo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: JogoScreen(),
    );
  }
}
