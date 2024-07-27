import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TabBoxButton extends StatelessWidget {
  final String icoPath;
  final String buttonLabel;
  final void Function() onTap;

  const TabBoxButton({
    super.key,
    required this.icoPath,
    required this.buttonLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(icoPath),
          const Spacer(),
          Text(
            buttonLabel,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}