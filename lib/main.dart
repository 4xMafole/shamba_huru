import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/content/content_view.dart';
import 'package:shamba_huru/views/content/main_feeds_view.dart';
import 'package:shamba_huru/views/content/home_view.dart';
import 'package:shamba_huru/views/content/profile/profile_view.dart';
import 'package:shamba_huru/views/content/profile/options/edit_profile_view.dart';
import 'package:shamba_huru/views/content/profile/options/my_farm_view.dart';
import 'package:shamba_huru/views/weather/crop_selection_view.dart';
import 'package:shamba_huru/views/onboarding/language_view.dart';
import 'package:shamba_huru/views/authentication/login_view.dart';
import 'package:shamba_huru/views/onboarding/onboard_view.dart';
import 'package:shamba_huru/views/authentication/otp_view.dart';
import 'package:shamba_huru/views/authentication/phone_view.dart';
import 'package:shamba_huru/views/weather/map_farm_view.dart';

import 'views/content/profile/my_feeds/add_my_feeds_view.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shamba Huru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        iconTheme: IconThemeData(
          color: AppColor.pullmanBrown,
        ),
      ),
      home: ContentView(),
    );
  }
}
