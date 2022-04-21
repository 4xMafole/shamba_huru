import 'dart:convert';

class UserPost {
  String userId;
  String username;
  String? photo;
  bool? isExpert;

  UserPost({
    required this.userId,
    required this.username,
    this.photo,
    this.isExpert,
  });

  UserPost copyWith({
    required String userId,
    required String username,
    String? photo,
    bool? isExpert,
  }) {
    return UserPost(
      userId: userId,
      username: username,
      photo: photo ?? this.photo,
      isExpert: isExpert ?? this.isExpert,
    );
  }

  UserPost merge(UserPost model) {
    return UserPost(
      userId: model.userId,
      username: model.username,
      photo: model.photo,
      isExpert: model.isExpert,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userId,
      'username': username,
      'photo': photo,
      'isExpert': isExpert,
    };
  }

  factory UserPost.fromMap(Map<String, dynamic> map) {
    return UserPost(
      userId: map['userID'],
      username: map['username'],
      photo: map['photo'],
      isExpert: map['isExpert'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPost.fromJson(String source) =>
      UserPost.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserPost(userId: $userId, username: $username, photo: $photo, isExpert: $isExpert)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserPost &&
        o.userId == userId &&
        o.username == username &&
        o.photo == photo &&
        o.isExpert == isExpert;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        username.hashCode ^
        photo.hashCode ^
        isExpert.hashCode;
  }
}
