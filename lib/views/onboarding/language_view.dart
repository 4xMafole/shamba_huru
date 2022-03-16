import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamba_huru/custom_widgets/scaled_list.dart';
import 'package:shamba_huru/models/list_item.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/onboarding/onboard_view.dart';

class LanguageView extends StatelessWidget {
  LanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaledList(
          itemCount: categories.length,
          itemColor: (index) {
            return kMixedColors[index % kMixedColors.length];
          },
          itemBuilder: (index, selectedIndex) {
            final category = categories[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedIndex == 0 ? "Chagua Lugha" : "Choose Language",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: selectedIndex == index ? 15 : 10),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: selectedIndex == index ? 100 : 80,
                  child: GestureDetector(
                      onTap: () => Get.to(OnboardView()),
                      child: Image.asset(category.image)),
                ),
                const SizedBox(height: 15),
                Text(
                  category.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: selectedIndex == index ? 25 : 20),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  final List<Color> kMixedColors = [
    AppColor.paleGreen,
    AppColor.deepBlue,
  ];

  final List<ListItem> categories = [
    ListItem(image: "assets/images/tanzania.png", name: "Swahili"),
    ListItem(image: "assets/images/england.png", name: "English"),
  ];
}
