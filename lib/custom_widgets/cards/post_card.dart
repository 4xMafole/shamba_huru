import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shamba_huru/controllers/content/feeds_controller.dart';
import 'package:shamba_huru/custom_widgets/texts/expert_label.dart';
import 'package:shamba_huru/custom_widgets/texts/text_01.dart';
import 'package:shamba_huru/custom_widgets/texts/username_text.dart';
import 'package:shamba_huru/utils/app_colors.dart';

class PostCard extends StatelessWidget {
  var controller;
  final int postIndex;
  PostCard({Key? key, required this.postIndex, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _head(),
              _content(),
              _userInteract(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  _head() => Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.paleBrown,
                  radius: 30,
                  backgroundImage: AssetImage(
                      controller.posData.value.posts[postIndex].user.photo!),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? Username
                        UsernameText(
                          username: controller
                              .posData.value.posts[postIndex].user.username,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //? Verification Badge
                        controller.posData.value.posts[postIndex].user.isExpert!
                            ? ExpertLabel(
                                labelText: "Expert",
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //? Location
                            Text01(
                              text: controller
                                  .posData.value.posts[postIndex].location,
                            ),
                            //? Date and Time
                            Text01(
                                text: controller
                                    .posData.value.posts[postIndex].time),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Container()),
                //? More Option Icon
                Icon(
                  Icons.more_vert_rounded,
                  color: AppColor.paleGreen,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            //? Post tags
            Container(
              height: 25,
              child: ListView.separated(
                itemCount:
                    controller.posData.value.posts[postIndex].tags.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _tag(
                      controller.posData.value.posts[postIndex].tags[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 5,
                  );
                },
              ),
            ),
          ],
        ),
      );

  _content() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? Content Image
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              controller.posData.value.posts[postIndex].photo,
              fit: BoxFit.cover,
              height: 350,
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? Title
                  Text(
                    controller.posData.value.posts[postIndex].title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.pullmanBrown,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //? Description
                  GestureDetector(
                    onTap: (() => controller.updateDesc(
                        controller.isFull.value, postIndex)),
                    child: Text(
                      controller.posData.value.posts[postIndex].description,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.paleBrown,
                      ),
                      overflow: controller.isFull.value
                          ? null
                          : TextOverflow.ellipsis,
                      maxLines: controller.isFull.value ? null : 2,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  _userInteract() => Padding(
        padding: const EdgeInsets.only(
          left: 12,
        ),
        child: Row(
          children: [
            LikeButton(
              onTap: controller.onLikeButtonTapped,
              circleColor: CircleColor(
                start: AppColor.paleBrown,
                end: AppColor.paleGreen,
              ),
              bubblesColor: BubblesColor(
                dotPrimaryColor: AppColor.paleBrown,
                dotSecondaryColor: AppColor.paleGreen,
              ),
              likeCount: controller.posData.value.posts[postIndex].likes,
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.front_hand_rounded,
                  color: isLiked
                      ? AppColor.paleGreen
                      : AppColor.paleBrown.withOpacity(0.4),
                );
              },
            ),
          ],
        ),
      );

  _tag(String tagName) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColor.paleGreen.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          tagName,
          style: TextStyle(
            color: AppColor.deepGreen,
            fontSize: 12,
          ),
        ),
      );
}
