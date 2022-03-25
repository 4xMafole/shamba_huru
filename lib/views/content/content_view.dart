import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidable/hidable.dart';
import 'package:shamba_huru/controllers/content_controller.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/content/feeds_view.dart';
import 'package:shamba_huru/views/content/home_view.dart';
import 'package:shamba_huru/views/content/profile_view.dart';

class ContentView extends StatelessWidget {
  ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ContentController controller =
        Get.put(ContentController(), permanent: false);
    return Obx(
      () => SafeArea(
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: Offstage(
            offstage: !controller.isVisible.value,
            child: customNav(size, controller),
          ),
          body: Obx(() => IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  HomeView(controller.scrollController1.value),
                  FeedView(controller.scrollController2.value),
                  ProfileView(controller.scrollController3.value),
                ],
              )),
        ),
      ),
    );
  }

  Widget customNav(Size size, ContentController controller) {
    return Container(
      margin: EdgeInsets.all(20),
      height: controller.isVisible.value ? size.width * .155 : 0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.deepGreen.withOpacity(.15),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.separated(
        itemCount: listOfIcons.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.changeTabIndex(index);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == controller.tabIndex.value
                          ? 0
                          : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == controller.tabIndex.value
                        ? size.width * .014
                        : 0,
                    decoration: BoxDecoration(
                      color: AppColor.paleGreen,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  )),
              Obx(() => Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == controller.tabIndex.value
                        ? AppColor.paleGreen
                        : AppColor.paleGreen.withOpacity(0.5),
                  )),
              SizedBox(height: size.width * .03),
            ],
          ),
        ),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: size.width * 0.11,
          );
        },
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.feed_rounded,
    Icons.person_rounded,
  ];
}
