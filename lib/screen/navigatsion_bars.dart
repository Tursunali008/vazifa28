import 'package:flutter/material.dart';
import 'package:vazifa28/screen/home_screen.dart';
import 'package:vazifa28/screen/qr_generete_screen.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int curIndex = 0; // Set default index to 0
  List<Widget> pages = [
    const QrGenerateScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(191, 60, 63, 79),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  curIndex == 0 ? const Color(0xffFDB623) : Colors.grey[800],
                ),
              ),
              onPressed: () {
                setState(() {
                  curIndex = 0;
                });
              },
              icon: const Icon(
                Icons.qr_code_2,
                color: Colors.white,
              ),
            ),
            IconButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  curIndex == 1 ? const Color(0xffFDB623) : Colors.grey[800],
                ),
              ),
              onPressed: () {
                setState(() {
                  curIndex = 1;
                });
              },
              icon: const Icon(
                Icons.qr_code_scanner_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: pages[curIndex],
    );
  }
}
