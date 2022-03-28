import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileController extends GetxController {
  final String nameControl = "username";
  final String workControl = "work";
  final String locationControl = "location";
  late FormGroup form;

  @override
  void onInit() {
    super.onInit();
    form = FormGroup({
      nameControl: FormControl<String>(validators: [Validators.required]),
      workControl: FormControl<String>(validators: [Validators.required]),
      locationControl: FormControl<String>(validators: [Validators.required]),
    });
  }
}
