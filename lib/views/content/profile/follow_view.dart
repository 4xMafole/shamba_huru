import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamba_huru/controllers/content/feeds_controller.dart';
import 'package:shamba_huru/controllers/content/profile/follow_controller.dart';

import '../../../utils/app_colors.dart';

class FollowView extends StatelessWidget {
  FollowView({Key? key}) : super(key: key);
  final FollowController _controller = Get.put(FollowController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: AppColor.deepGreen,
                elevation: 0,
                leading: IconButton(
                  onPressed: (() => Get.back()),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
                bottom: TabBar(
                  controller: _controller.tabController,
                  indicatorColor: Colors.white,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      text: "Followers",
                    ),
                    Tab(
                      text: "Following",
                    ),
                  ],
                ),
                title: Text(
                  "Scolastica Milanzi",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ];
          }),
          body: TabBarView(
            controller: _controller.tabController,
            children: [
              _followers(),
              _following(),
            ],
          ),
        ),
      ),
    );
  }

  _followers() => Center(
        child: SizedBox(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/follows.png",
                width: 60,
                height: 60,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'No followers',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
  _following() => InkWell(
        onTap: () {
          //TODO: popup a suggestion bottom sheet.
        },
        child: Center(
          child: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/new_follows.png",
                  width: 60,
                  height: 60,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Add following',
                  style: TextStyle(
                    color: AppColor.paleGreen,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
