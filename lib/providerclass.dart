import 'package:flutter/material.dart';

class Posts {
  final String username;
  final String name;
  final String body;
  Posts({
    required this.username,
    required this.name,
    required this.body,
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
