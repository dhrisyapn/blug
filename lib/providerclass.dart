import 'package:flutter/material.dart';

class Posts {
  final String username;
  final String name;
  final String body;
  final String image;
  final String profile;

  Posts({
    required this.username,
    required this.name,
    required this.body,
    required this.image,
    required this.profile,
  });
}

class PostsProvider with ChangeNotifier {
  final List<Posts> postdata = [];
  void addPost(Posts post) {
    postdata.add(post);
    notifyListeners();
  }

  List<Posts> get post => postdata;
}
