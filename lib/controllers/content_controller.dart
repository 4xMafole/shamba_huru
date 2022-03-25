import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  var tabIndex = 0.obs;
  RxBool isVisible = true.obs;
  late Rx<ScrollController> scrollController1;
  late Rx<ScrollController> scrollController2;
  late Rx<ScrollController> scrollController3;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    scrollController1 = ScrollController().obs;
    scrollController2 = ScrollController().obs;
    scrollController3 = ScrollController().obs;

    scrollControl(scrollController1);
    scrollControl(scrollController2);
    scrollControl(scrollController3);
    super.onInit();
  }

  void scrollControl(Rx<ScrollController> controller) {
    controller.value.addListener(() {
      isVisible.value = !(controller.value.position.userScrollDirection ==
          ScrollDirection.reverse);
    });
  }

  @override
  void dispose() {
    scrollController1.value.dispose();
    scrollController2.value.dispose();
    scrollController3.value.dispose();
    super.dispose();
  }
}
