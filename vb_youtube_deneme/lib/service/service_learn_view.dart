import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:vb_youtube_deneme/service/post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _postList = [];
  final String baseUrl = "https://jsonplaceholder.typicode.com/";
  final String url = "https://jsonplaceholder.typicode.com/posts";
  bool _isLoading = false;
  late final Dio networkManager;

  void _isLoadingChange() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _isLoadingChange();
    final response = await networkManager.get("posts");
    if (response.statusCode == HttpStatus.ok) {
      final _data = response.data;
      if (_data is List) {
        setState(() {
          _postList = _data.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    print(response);
    _isLoadingChange();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networkManager = Dio(BaseOptions(baseUrl: baseUrl));
    fetchPostItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Learn"),
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox(),
        ],
      ),
      body: ListView.builder(
        itemCount: _postList?.length ?? 0,
        itemBuilder: (context, index) {
          return Card(
            child: Text(
                "${_postList?[index].id} /${_postList?[index].userId} / ${_postList?[index].body}"),
          );
        },
      ),
    );
  }
}
