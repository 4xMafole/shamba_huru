import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamba_huru/custom_widgets/texts/expert_label.dart';
import 'package:shamba_huru/custom_widgets/texts/text_01.dart';
import 'package:shamba_huru/custom_widgets/texts/username_text.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/content/profile/options/my_farm_view.dart';
import 'package:shamba_huru/views/content/profile/options/settings/settings_view.dart';
import 'package:shamba_huru/views/weather/crop_selection_view.dart';
import 'package:shamba_huru/views/weather/map_farm_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(ScrollController value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 75,
          ),
          _profile(),
          _myDetails(),
        ],
      ),
    ));
  }

  _profile() => Stack(
        children: [
          Card(
            margin: EdgeInsets.only(
              top: 55.0,
              right: 20,
              left: 20,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  UsernameText(
                    username: "Scolastica Milanzi",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //? Username
                      Text01(
                        text: "Agriculture",
                        font: 14,
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      //? Verification Badge
                      true
                          ? ExpertLabel(
                              labelText: "Expert",
                            )
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Divider(
                      color: AppColor.grey,
                      height: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      counter("10", "Following"),
                      counter("50", "Feeds"),
                      counter("600", "Followers"),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: AppColor.paleBrown,
              radius: 45,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
        ],
      );
  Widget counter(String counter, String counterName) {
    return Column(
      children: <Widget>[
        Text(
          counter,
          style: TextStyle(
            color: AppColor.paleGreen,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          counterName,
          style: TextStyle(
            color: AppColor.pullmanBrown,
          ),
        ),
      ],
    );
  }

  _myDetails() => Card(
        margin: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Get.to(MyFarmView()),
                child: ListTile(
                  title: Text(
                    "My Farm",
                    style: TextStyle(
                      color: AppColor.pullmanBrown,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.paleGreen,
                  ),
                ),
              ),
              Divider(
                color: AppColor.grey,
              ),
              GestureDetector(
                onTap: () => Get.to(CropSelectionView()),
                child: ListTile(
                  title: Text(
                    "My Crop",
                    style: TextStyle(
                      color: AppColor.pullmanBrown,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.paleGreen,
                  ),
                ),
              ),
              Divider(
                color: AppColor.grey,
              ),
              GestureDetector(
                onTap: () => Get.to(() => SettingsView()),
                child: ListTile(
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      color: AppColor.pullmanBrown,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.paleGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
