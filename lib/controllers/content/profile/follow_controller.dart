import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
    );

    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
