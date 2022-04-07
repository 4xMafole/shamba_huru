import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shamba_huru/controllers/content/profile/edit_profile_controller.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/content/profile/options/settings/settings_view.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({Key? key}) : super(key: key);

  final EditProfileController _controller = Get.put(EditProfileController());

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/profile.jpg",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: AppColor.paleGreen,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ReactiveForm(
                formGroup: _controller.form,
                child: Column(
                  children: <Widget>[
                    ReactiveTextField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: AppColor.phthaloGreen.withOpacity(0.5),
                        ),
                      ),
                      formControlName: _controller.nameControl,
                    ),
                    ReactiveTextField(
                      decoration: InputDecoration(
                        labelText: "Field of Work",
                        labelStyle: TextStyle(
                          color: AppColor.phthaloGreen.withOpacity(0.5),
                        ),
                      ),
                      formControlName: _controller.workControl,
                    ),
                    ReactiveTextField(
                      decoration: InputDecoration(
                        labelText: "Location",
                        labelStyle: TextStyle(
                          color: AppColor.phthaloGreen.withOpacity(0.5),
                        ),
                      ),
                      formControlName: _controller.locationControl,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReactiveFormConsumer(builder: (context, form, child) {
                      return InkWell(
                        onTap: form.valid
                            ? () {
                                Get.to(SettingsView());
                              }
                            : null,
                        child: Container(
                          width: 230,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [AppColor.deepGreen, AppColor.paleGreen],
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
