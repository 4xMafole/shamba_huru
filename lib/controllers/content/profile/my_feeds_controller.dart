import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/posts.dart';
import '../../../models/post.dart';
import '../../../models/user.dart';

class MyFeedsController extends GetxController {
  final Rx<PostsData> posData = PostsData().obs;

  final RxBool isFull = false.obs;

  void updateDesc(bool updateBool, int index) {
    // posData.value.posts[index].isFull = !updateBool;
    isFull.value = !updateBool;
  }

  Future<bool?> onLikeButtonTapped(bool isLiked) async {
    //send the request here
    //final bool success = await sendRequest();

    //if failed, you can do nothing
    //return success? !isLiked:isLiked;

    return !isLiked;
  }

  loadNextData() {
    final initialIndex = posData.value.posts.length;
    final finalIndex = posData.value.posts.length + 10;
    print('load data from ${posData.value.posts.length}');

    Future.delayed(Duration(seconds: 3), () {
      for (var i = initialIndex; i < finalIndex; ++i) {
        posData.value.posts.add(
          Post(
            user: UserPost(
              userId: "$i",
              username: "Scolastica Milanzi",
              photo: "assets/images/profile.jpg",
              isExpert: true,
            ),
            location: "Mbeya, Tanzania",
            time: "21 Nov 2021 00:00 am",
            tags: ["Soyabean", "Cassava", "Banana"],
            photo: "assets/images/plough.jpg",
            title: "Before Maize cultivation, Do seed treatment like this:",
            description:
                "It is very important to treat the seeds before maize cultivation. Seed treatment protects the crop frrom various diseases. Along with this, the risk of crop damage by may types of fungi is also reduced. You can treat the seeds.",
            likes: 987,
            isFull: false,
          ),
        );
      }
      print('${posData.value.posts.length} data now');
      posData.refresh();
    });
  }

  //todo: App does not scroll until I reload the app
  /* 
    -------------Auto-Scroll Method-----------
    scrollToIndexedFeed(double index, ScrollController controller) {
      if (controller.hasClients) {
        final contentSize = controller.position.viewportDimension +
            controller.position.maxScrollExtent;
        final itemCount = posData.value.posts.length;
        final target = contentSize * index / itemCount;
        controller.position.animateTo(
          target,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
      }
    } */
}
