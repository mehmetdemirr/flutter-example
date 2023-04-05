import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/service/comment_model.dart';
import 'package:dio/dio.dart';

class CommentShow extends StatefulWidget {
  const CommentShow({super.key});

  @override
  State<CommentShow> createState() => _CommentShowState();
}

class _CommentShowState extends State<CommentShow> {
  List<CommentModel>? commentList;
  late final Dio networkManager;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    networkManager =
        Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
    commentFetch();
  }

  Future<void> commentFetch() async {
    changeLoading();
    final response = await networkManager.get("comments");
    if (response.statusCode == HttpStatus.ok) {
      var datas = response.data;
      if (datas is List) {
        setState(() {
          commentList = datas.map((e) => CommentModel.fromJson(e)).toList();
        });
      }
    } else {
      print("veri gelmedi");
    }
    setState(() {
      isLoading = !isLoading;
    });
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: commentList?.length ?? 10,
              itemBuilder: (context, index) {
                return CommentCard(
                  model: commentList?[index],
                );
              },
            ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    this.model,
  });

  final CommentModel? model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
          "id:${model?.id} \nemail:${model?.email} \nYorum:${model?.body}"),
    );
  }
}
