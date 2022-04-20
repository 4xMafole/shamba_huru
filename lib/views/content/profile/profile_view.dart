import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:shamba_huru/controllers/content/profile/my_feeds_controller.dart';
import 'package:shamba_huru/custom_widgets/texts/expert_label.dart';
import 'package:shamba_huru/custom_widgets/texts/text_01.dart';
import 'package:shamba_huru/custom_widgets/texts/username_text.dart';
import 'package:shamba_huru/utils/app_colors.dart';
import 'package:shamba_huru/views/content/profile/feeds_list_view.dart';
import 'package:shamba_huru/views/content/profile/options/my_farm_view.dart';
import 'package:shamba_huru/views/content/profile/options/settings/settings_view.dart';
import 'package:shamba_huru/views/weather/crop_selection_view.dart';
import 'package:shamba_huru/views/weather/map_farm_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../custom_widgets/app_loading_indicator.dart';

class ProfileView extends StatelessWidget {
  final ScrollController scrollController;
  ProfileView({Key? key, required this.scrollController}) : super(key: key);

  final MyFeedsController _controller = Get.put(MyFeedsController());

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
          actions: [
            IconButton(
              onPressed: () {
                _editBottomModal(widget: _options());
              },
              icon: Icon(Icons.menu),
              iconSize: 30,
            )
          ],
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _profile(),
              Divider(
                color: Colors.grey.shade400,
                height: 1,
              ),
              Obx(() => _myDetails()),
            ],
          ),
        ));
  }

  _profile() => Stack(
        children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            margin: EdgeInsets.only(
              top: 55.0,
              right: 20,
              left: 20,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  UsernameText(
                    username: "Scolastica Milanzi",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //? Username
                      Text01(
                        text: "Agriculture",
                        font: 14,
                      ),

                      SizedBox(
                        width: 10,
                      ),
                      //? Verification Badge
                      true
                          ? ExpertLabel(
                              labelText: "Expert",
                            )
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Divider(
                      color: AppColor.grey,
                      height: 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      counter("10", "Following"),
                      InkWell(
                          onTap: () {
                            final ScrollController scrollController1 =
                                ScrollController();
                            Get.to(() => FeedsListView(
                                  scrollController: scrollController1,
                                ));
                          },
                          child: counter("50", "Feeds")),
                      counter("600", "Followers"),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: AppColor.paleBrown,
              radius: 45,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
        ],
      );

  Widget counter(String counter, String counterName) {
    return Column(
      children: <Widget>[
        Text(
          counter,
          style: TextStyle(
            color: AppColor.paleGreen,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          counterName,
          style: TextStyle(
            color: AppColor.pullmanBrown,
          ),
        ),
      ],
    );
  }

  _myDetails() => _controller.posData.value.posts.isEmpty
      ? Expanded(
          child: GestureDetector(
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
          ),
        )
      : Flexible(
          child: InfiniteGridView(
            controller: scrollController,
            loadingWidget: Shimmer.fromColors(
              child: Card(
                child: Container(),
              ),
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade300,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final ScrollController scrollController = ScrollController();

                  Get.to(() => FeedsListView(
                        postIndex: index,
                        scrollController: scrollController,
                      ));
                },
                child: Card(
                  child: Image.asset(
                    _controller.posData.value.posts[index].photo,
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            },
            itemCount: _controller.posData.value.posts.length,
            hasNext: _controller.posData.value.posts.length < 200,
            nextData: _controller.loadNextData,
          ),
        );

  _options() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                Get.to(MyFarmView());
              },
              child: ListTile(
                title: Text(
                  "My Farm",
                  style: TextStyle(
                    color: AppColor.pullmanBrown,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.paleGreen,
                ),
              ),
            ),
            Divider(
              color: AppColor.grey,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.to(CropSelectionView());
              },
              child: ListTile(
                title: Text(
                  "My Crop",
                  style: TextStyle(
                    color: AppColor.pullmanBrown,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.paleGreen,
                ),
              ),
            ),
            Divider(
              color: AppColor.grey,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.to(() => SettingsView());
              },
              child: ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: AppColor.pullmanBrown,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.paleGreen,
                ),
              ),
            ),
          ],
        ),
      );

  void _editBottomModal({required Widget widget}) => Get.bottomSheet(
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 5),
              const Center(
                child: Divider(
                  indent: 190,
                  endIndent: 190,
                  height: 10,
                  thickness: 4,
                ),
              ),
              widget,
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
