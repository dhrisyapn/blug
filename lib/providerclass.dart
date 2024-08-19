import 'package:flutter/material.dart';

class Posts {
  final String username;
  final String name;
  final String body;
  final String image;
  final String profile;
  final DateTime timestamp;

  Posts({
    required this.username,
    required this.name,
    required this.body,
    required this.image,
    required this.profile,
    required this.timestamp,
  });
}

class PostsProvider with ChangeNotifier {
  final List<Posts> postdata = [];
  String postCount = '0';
  void addPost(Posts post) {
    postdata.add(post);
    notifyListeners();
  }

  void setCount(String count) {
    postCount = count;
    notifyListeners();
  }

  List<Posts> get post => postdata;
}
