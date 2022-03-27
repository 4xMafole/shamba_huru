import 'package:flutter/material.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class Text01 extends StatelessWidget {
  const Text01({
    Key? key,
    required this.text,
    this.font = 12,
  }) : super(key: key);

  final String text;
  final double? font;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: font,
        color: AppColor.paleBrown.withOpacity(0.5),
      ),
    );
  }
}
