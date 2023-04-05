import 'dart:io';

import 'post_model.dart';
import 'package:dio/dio.dart';

class PostService {
  final Dio networkManager =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  //post gönder
  Future<bool> postSend(PostModel model, bool) async {
    var response = await networkManager.post(
      "posts",
      data: model,
    );
    if (response.statusCode == HttpStatus.created) {
      return true;
    } else {
      return false;
    }
  }

  //postları çek
  Future<List<PostModel>?> fetchPostItems() async {
    List<PostModel>? postList;
    final response = await networkManager.get("posts");
    if (response.statusCode == HttpStatus.ok) {
      final _data = response.data;
      if (_data is List) {
        return postList = _data.map((e) => PostModel.fromJson(e)).toList();
      }
    } else {
      return null;
    }
  }
}
