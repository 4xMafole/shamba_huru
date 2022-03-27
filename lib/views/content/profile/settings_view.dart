import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/authentication/login_view.dart';
import 'package:shamba_huru/views/authentication/phone_view.dart';
import 'package:shamba_huru/views/onboarding/language_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.deepGreen,
        ),
        backgroundColor: AppColor.deepGreen,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.profile_circled,
                  iconStyle: IconStyle(),
                  titleStyle: TextStyle(
                    color: AppColor.pullmanBrown,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitleStyle: TextStyle(
                    color: AppColor.paleBrown.withOpacity(0.5),
                  ),
                  title: 'Edit Profile',
                  subtitle: "Update username and field of work",
                ),
                SettingsItem(
                  onTap: () => Get.to(LanguageView()),
                  icons: CupertinoIcons.globe,
                  titleStyle: TextStyle(
                    color: AppColor.pullmanBrown,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitleStyle: TextStyle(
                    color: AppColor.paleBrown.withOpacity(0.5),
                  ),
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Language',
                  subtitle: "Choose a preferred language",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              settingsGroupTitleStyle: TextStyle(
                color: AppColor.pullmanBrown,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              items: [
                SettingsItem(
                  onTap: () => Get.to(PhoneView()),
                  icons: CupertinoIcons.repeat,
                  titleStyle: TextStyle(
                    color: AppColor.pullmanBrown,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitleStyle: TextStyle(
                    color: AppColor.paleBrown.withOpacity(0.5),
                  ),
                  subtitle: "Update your phone number",
                  title: "Change phone number",
                ),
                SettingsItem(
                  onTap: () => Get.offAll(() => LoginView()),
                  icons: Icons.exit_to_app_rounded,
                  titleStyle: TextStyle(
                    color: AppColor.pullmanBrown,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitleStyle: TextStyle(
                    color: AppColor.paleBrown.withOpacity(0.5),
                  ),
                  subtitle: "Take a break from our app",
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  subtitleStyle: TextStyle(
                    color: AppColor.paleBrown.withOpacity(0.5),
                  ),
                  subtitle: "Account deleted cannot be recovered",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: AppColor.paleGreen,
                  ),
                  title: 'About',
                  titleStyle: TextStyle(
                    color: AppColor.pullmanBrown,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitleStyle: TextStyle(
                    color: AppColor.paleBrown.withOpacity(0.5),
                  ),
                  subtitle: "Learn more about Shamba Huru App",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
