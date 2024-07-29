import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertDialogWidget extends StatefulWidget {
  final String result;

  const AlertDialogWidget({
    super.key,
    required this.result,
  });

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  Future<void> _launchUrl({required Uri url}) async {
    if (!await launchUrl(url)) {
      throw Exception('Url Topilmadi: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffFDB623),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              "Havolani Ulashish",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Share.share(
                widget.result,
                subject: "Havola!",
              );
            },
            icon: const Icon(
              Icons.share,
              color: Colors.red,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.result,
              style: const TextStyle(
                color: Color.fromARGB(255, 11, 37, 132),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Orqaga",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(137, 240, 140, 59),
              ),
              child: const Text(
                "Ochish . . .",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                _launchUrl(url: Uri.parse(widget.result));
                Navigator.of(context).pop(); 
              },
            ),
          ],
        ),
      ],
    );
  }
}
