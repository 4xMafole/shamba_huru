import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamba_huru/custom_widgets/promo_card.dart';
import 'package:shamba_huru/custom_widgets/trailing_header.dart';
import 'package:shamba_huru/custom_widgets/weather_card.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 15, end: 12),
            badgeColor: AppColor.paleBrown,
            elevation: 0,
            badgeContent: null,
            child: IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.notifications,
                color: AppColor.paleGreen.withOpacity(0.5),
              ),
              onPressed: () {
                //! show notification bottom sheet
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PromoCard(),
              SizedBox(
                height: 50,
              ),
              WeatherCard(
                icon: "02d",
                temp: "18.72",
                feeltemp: "17.8",
                description: "Clear Sky",
              ),
              SizedBox(
                height: 30,
              ),
              TrailingHeader(
                heading: "Page is still under development",
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
