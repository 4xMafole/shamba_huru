import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:shamba_huru/models/user_post.dart';

class Post {
  int postId;
  UserPost user;
  String location;
  String time;
  List<String> tags;
  String photo;
  String title;
  String description;
  int likes;
  bool isFull;

  Post({
    required this.postId,
    required this.user,
    required this.location,
    required this.time,
    required this.tags,
    required this.photo,
    required this.title,
    required this.description,
    required this.likes,
    required this.isFull,
  });

  Post copyWith({
    required int postId,
    required UserPost user,
    required String location,
    required String time,
    required List<String> tags,
    required String photo,
    required String title,
    required String description,
    required int likes,
    required bool isFull,
  }) {
    return Post(
      postId: postId,
      user: user,
      location: location,
      time: time,
      tags: tags,
      photo: photo,
      title: title,
      description: description,
      likes: likes,
      isFull: isFull,
    );
  }

  Post merge(Post model) {
    return Post(
      postId: model.postId,
      user: model.user,
      location: model.location,
      time: model.time,
      tags: model.tags,
      photo: model.photo,
      title: model.title,
      description: model.description,
      likes: model.likes,
      isFull: model.isFull,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postID': postId,
      'user': user.toMap(),
      'location': location,
      'time': time,
      'tags': tags,
      'photo': photo,
      'title': title,
      'description': description,
      'likes': likes,
      'isFull': isFull,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postID'],
      user: UserPost.fromMap(map['user']),
      location: map['location'],
      time: map['time'],
      tags: List<String>.from(map['tags']),
      photo: map['photo'],
      title: map['title'],
      description: map['description'],
      likes: map['likes'],
      isFull: map['isFull'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(postId: $postId, user: $user, location: $location, time: $time, tags: $tags, photo: $photo, title: $title, description: $description, likes: $likes, isFull: $isFull)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
        other.postId == postId &&
        other.user == user &&
        other.location == location &&
        other.time == time &&
        listEquals(other.tags, tags) &&
        other.photo == photo &&
        other.title == title &&
        other.description == description &&
        other.likes == likes &&
        other.isFull == isFull;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        user.hashCode ^
        location.hashCode ^
        time.hashCode ^
        tags.hashCode ^
        photo.hashCode ^
        title.hashCode ^
        description.hashCode ^
        likes.hashCode ^
        isFull.hashCode;
  }
}
