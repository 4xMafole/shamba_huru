import 'package:get/get.dart';
import 'package:shamba_huru/data/posts.dart';

class FeedsController extends GetxController {
  final Rx<postsData> posData = postsData().obs;
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
}
