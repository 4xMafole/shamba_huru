import 'package:flutter/material.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class ExpertLabel extends StatelessWidget {
  const ExpertLabel({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.deepGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        labelText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
