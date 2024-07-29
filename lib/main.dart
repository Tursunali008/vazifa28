import 'package:flutter/material.dart';
import 'package:vazifa28/screen/navigatsion_bars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationBars(),
    );
  }
}