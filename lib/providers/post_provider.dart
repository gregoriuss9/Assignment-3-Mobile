import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';

class PostProvider with ChangeNotifier {
  List<PostModel> _posts = <PostModel>[];

  final url_posts = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  List<PostModel> get posts {
    return [..._posts];
  }

  Future<void> fetchPosts() async {
    try {
      final response_posts = await http.get(url_posts);
      final extractedDataPosts =
          json.decode(response_posts.body) as List<dynamic>;
      List<PostModel> loadedDataPosts = [];

      extractedDataPosts.forEach((posts) {
        final currentPostData = PostModel(
          userId: int.parse(posts['userId'].toString()),
          id: int.parse(posts['id'].toString()),
          title: posts['title'],
          body: posts['body'],
        );
        loadedDataPosts.add(currentPostData);
      });

      _posts = loadedDataPosts;
    } catch (error) {
      rethrow;
    }
  }
}
