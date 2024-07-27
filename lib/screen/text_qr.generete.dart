import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vazifa28/screen/navigatsion_bars.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TextQrGenerate extends StatefulWidget {
  const TextQrGenerate({super.key});

  @override
  State<TextQrGenerate> createState() => _TextQrGenerateState();
}

class _TextQrGenerateState extends State<TextQrGenerate> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NavigationBars();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(241, 25, 25, 25),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Color(0xffFDB623),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Text QR",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Center(
                  child: Container(
                    width: 336,
                    height: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: const Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xffFDB623),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Image.asset(
                          "assets/images/text2.png",
                          width: 60,
                          height: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            const Text(
                              "Text",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffD9D9D9),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: textController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "Enter Text",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              validator: (value) {
                                if (textController.text.isEmpty) {
                                  return "Iltimos text kiriting!";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        ZoomTapAnimation(
                          onTap: () {
                            if (textController.text.isNotEmpty) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Center(
                                      child: Text(
                                        "Text QR",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      Center(
                                        child: QrImageView(
                                          data: textController.text,
                                          version: QrVersions.auto,
                                          size: 200.0,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            width: 153,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffFDB623),
                            ),
                            child: const Center(
                              child: Text(
                                "Generate QR Code",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}