import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shamba_huru/custom_widgets/login_button.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/utils/constant.dart';
import 'package:shamba_huru/views/phone_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Icon(Icons.arrow_back_ios_rounded),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColor.paleGreen,
              AppColor.deepGreen,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Container()),
              Image.asset(
                'assets/icons/logo.png',
                color: Colors.white,
                height: 150,
              ),
              Expanded(child: Container()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'By tapping Create Account or Sign In, you agree to our\n',
                        style: kNormalText,
                      ),
                      TextSpan(
                        text: 'Terms',
                        style: kUnderlinedText,
                      ),
                      TextSpan(
                        text: '. Learn how we process your data in our ',
                        style: kNormalText,
                      ),
                      TextSpan(
                        text: 'Privacy\nPolicy',
                        style: kUnderlinedText,
                      ),
                      TextSpan(
                        text: ' and ',
                        style: kNormalText,
                      ),
                      TextSpan(
                        text: 'Cookies Policy',
                        style: kUnderlinedText,
                      ),
                      TextSpan(
                        text: '.',
                        style: kNormalText,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              LoginButtonWidget(
                text: 'SIGN IN WITH GOOGLE',
                icon: "assets/icons/google.svg",
              ),
              LoginButtonWidget(
                text: 'SIGN IN WITH FACEBOOK',
                icon: "assets/icons/facebook.svg",
              ),
              InkWell(
                onTap: () => Get.to(PhoneView()),
                child: LoginButtonWidget(
                  text: 'SIGN IN WITH PHONE NUMBER',
                  icon: "assets/icons/phone.svg",
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Trouble Signing In?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
