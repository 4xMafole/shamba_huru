import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shamba_huru/views/content/profile/my_feeds/add_my_feeds_view.dart';

import '../../../../controllers/content/profile/my_feeds_controller.dart';
import '../../../../custom_widgets/cards/post_card.dart';
import '../../../../utils/app_colors.dart';

class MyFeedsListView extends StatelessWidget {
  final int postIndex;
  final ScrollController? scrollController;
  MyFeedsListView({Key? key, this.postIndex = 0, this.scrollController})
      : super(key: key);

  final MyFeedsController _controller = Get.put(MyFeedsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _verifyButton(context),
        appBar: AppBar(
          backgroundColor: AppColor.deepGreen,
          elevation: 0,
          leading: IconButton(
            onPressed: (() => Get.back()),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Feeds List",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        extendBody: true,
        body: Obx(
          () => _controller.posData.value.posts.isEmpty
              ? GestureDetector(
                  onTap: () {
                    //todo: Open new feeds page
                    print("Creating new feeds");
                  },
                  child: Center(
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/news_feed.png",
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            'Add New Feeds',
                            style: TextStyle(
                              color: AppColor.paleGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : InfiniteListView.separated(
                  controller: scrollController,
                  loadingWidget: Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballBeat,
                        colors: [
                          AppColor.paleGreen,
                        ],
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.posData.value.posts.length,
                  itemBuilder: ((context, index) {
                    return PostCard(
                      postIndex: index,
                      controller: _controller,
                    );
                  }),
                  hasNext: _controller.posData.value.posts.length < 20,
                  nextData: _controller.loadNextData,
                  separatorBuilder: (context, index) {
                    return Container();
                  }),
        ));
  }

  Widget _verifyButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: AppColor.paleGreen,
        padding: const EdgeInsets.all(10.0),
      ),
      onPressed: () {
        //todo: Open new feeds page
        Get.to(() => AddMyFeedsView());
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}