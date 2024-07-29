import 'package:flutter/material.dart';
import 'package:vazifa28/screen/text_qr.generete.dart';
import 'package:vazifa28/screen/web_qr_generet.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class QrGenerateScreen extends StatefulWidget {
  const QrGenerateScreen({super.key});

  @override
  State<QrGenerateScreen> createState() => _QrGenerateScreenState();
}

class _QrGenerateScreenState extends State<QrGenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 46, right: 46, top: 20, bottom: 20),
          child: Column(
            children: [
              const Text(
                "Generate QR",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffD9D9D9),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const TextQrGenerate();
                          },
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/text1.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const WebQrGenerate();
                          },
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/web2.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
