import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vazifa28/widgets/alert_diolog.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        setState(
          () {
            result = scanData;
            if (result!.code != null) {
              controller.pauseCamera();

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialogWidget(result: result!.code.toString());
                },
              ).then(
                (value) {
                  Future.delayed(const Duration(seconds: 5));
                  controller.resumeCamera();
                  setState(() {});
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          padding:
              const EdgeInsets.only(left: 26, right: 26, top: 5, bottom: 5),
          width: 336,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff333333),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZoomTapAnimation(
                onTap: () {},
                child: Image.asset(
                  "assets/icons/image_icon.png",
                  width: 30,
                  height: 30,
                ),
              ),
              ZoomTapAnimation(
                onTap: () async{
                  await controller?.toggleFlash();
                },
                child: Image.asset(
                  "assets/icons/spichka.png",
                  width: 25,
                  height: 25,
                ),
              ),
              ZoomTapAnimation(
                onTap: () async {
                  await controller?.flipCamera();
                },
                child: Image.asset(
                  "assets/icons/camera.png",
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
     
      body: SafeArea(
        child: Column(
          children: [
            
            Expanded(
              flex: 5,
              child: QRView(
                overlay: QrScannerOverlayShape(
                  borderColor: const Color(0xffFDB623),
                  borderRadius: 10,
                  borderWidth: 16,
                  borderLength: 25,
                ),
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ],
        ),
      ),
    );
  }
}