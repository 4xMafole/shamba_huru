import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shamba_huru/controllers/content/feeds_controller.dart';
import 'package:shamba_huru/custom_widgets/cards/post_card.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class MainFeedView extends StatelessWidget {
  ScrollController sController;
  MainFeedView(this.sController, {Key? key}) : super(key: key);

  final FeedsController _controller = Get.put(FeedsController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColor.deepGreen,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.deepGreen,
        elevation: 0,
        title: Text(
          "Feeds",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      extendBody: true,
      body: ListView.builder(
        controller: sController,
        physics: BouncingScrollPhysics(),
        itemCount: _controller.posData.value.posts.length,
        itemBuilder: ((context, index) {
          return PostCard(
            postIndex: index,
            controller: _controller,
          );
        }),
      ),
    );
  }
}
