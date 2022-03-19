import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color color;
  const AppLoadingIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 60,
      width: 60,
      child: LoadingIndicator(
        indicatorType: Indicator.ballTrianglePathColoredFilled,
        colors: [color],
        strokeWidth: 2,
      ),
    ));
  }
}
