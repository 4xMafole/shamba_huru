import 'package:shamba_huru/models/follow.dart';

class FollowData {
  List<Follow> followers = [
    Follow(
      userId: "y219",
      photo: "assets/images/profile1.jpg",
      name: "Josephat John",
      profession: "Bwana Shamba",
      isFollower: true,
    ),
    Follow(
      userId: "213ewq",
      photo: "assets/images/profile.jpg",
      name: "Dr.Harima Swai",
      profession: "Agriculturists",
      isFollower: true,
    ),
  ];

  List<Follow> following = [
    Follow(
      userId: "y219",
      photo: "assets/images/profile1.jpg",
      name: "Mzee. James",
      profession: "Bwana Shamba",
      isFollower: false,
    ),
    Follow(
      userId: "213ewq",
      photo: "assets/images/profile.jpg",
      name: "Joyce",
      profession: "Agriculturists",
      isFollower: false,
    ),
  ];
  List<Follow> sugFollowing = [
    Follow(
      userId: "y219",
      photo: "assets/images/profile1.jpg",
      name: "Mzee. James",
      profession: "Bwana Shamba",
      isFollower: false,
    ),
    Follow(
      userId: "213ewq",
      photo: "assets/images/profile.jpg",
      name: "Joyce",
      profession: "Agriculturists",
      isFollower: false,
    ),
    Follow(
      userId: "y219",
      photo: "assets/images/profile1.jpg",
      name: "Mzee. James",
      profession: "Bwana Shamba",
      isFollower: false,
    ),
    Follow(
      userId: "213ewq",
      photo: "assets/images/profile.jpg",
      name: "Joyce",
      profession: "Agriculturists",
      isFollower: false,
    ),
  ];
}
