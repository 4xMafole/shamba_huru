import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shamba_huru/controllers/feeds_controller.dart';
import 'package:shamba_huru/custom_widgets/post_card.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class FeedView extends StatelessWidget {
  ScrollController sController;
  FeedView(this.sController, {Key? key}) : super(key: key);

  final FeedsController _controller = Get.put(FeedsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
