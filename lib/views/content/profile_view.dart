import 'package:flutter/material.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/coming_soon.png",
                    width: 60,
                    height: 60,
                    color: AppColor.paleGreen,
                  ),
                  Text(
                    'PROFILE COMING SOON',
                    style: TextStyle(
                      color: AppColor.paleGreen,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
