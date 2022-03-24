import 'package:flutter/material.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class TrailingHeader extends StatelessWidget {
  String heading;

  TrailingHeader({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColor.pullmanBrown.withOpacity(0.4),
          ),
          child: Text(
            heading,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        Text(
          "- - - - - - - - - - -",
          style: TextStyle(
            color: AppColor.pullmanBrown.withOpacity(0.4),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
