import 'dart:io';

import 'package:christian_picker_image/christian_picker_image.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddFeedController extends GetxController {
  final String titleControl = "title";
  final String descControl = "description";
  final RxString feedImage = "".obs;
  late FormGroup form;

  @override
  void onInit() {
    super.onInit();
    form = FormGroup({
      titleControl: FormControl<String>(validators: [Validators.required]),
      descControl: FormControl<String>(validators: [Validators.required]),
    });
  }

  void takeImage() async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    List<File> images = await ChristianPickerImage.pickImages(maxImages: 1);
    feedImage.value = images[0].path;
    print("IMAGE PATH: " + images[0].path);
    Get.back();
  }

  Future pickImage() async {
    takeImage();
  }
}
