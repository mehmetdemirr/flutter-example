import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';
import 'package:dio/dio.dart';
import 'package:vb_youtube_deneme/service/post_model.dart';

class PostSend extends StatefulWidget {
  const PostSend({super.key});

  @override
  State<PostSend> createState() => _PostSendState();
}

class _PostSendState extends State<PostSend> {
  var tf_userid = TextEditingController();
  var tf_title = TextEditingController();
  var tf_body = TextEditingController();
  late final Dio networkManager;
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    networkManager =
        Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  }

  Future<void> postSend(PostModel model) async {
    changeLoading();
    var response = await networkManager.post(
      "posts",
      data: model,
    );
    if (response.statusCode == HttpStatus.created) {
      print("başarılı");
    } else {
      print("başarısız");
    }
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Padding(
          padding: PaddingItems.vertical,
          child: _TextField(
            hint: "user id",
            controller: tf_userid,
          ),
        ),
        Padding(
          padding: PaddingItems.vertical,
          child: _TextField(
            hint: "title",
            controller: tf_title,
          ),
        ),
        Padding(
          padding: PaddingItems.vertical,
          child: _TextField(
            hint: "body",
            controller: tf_body,
          ),
        ),
        ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
                  if (tf_userid.text.isNotEmpty &&
                      tf_title.text.isNotEmpty &&
                      tf_body.text.isNotEmpty) {
                    final model = PostModel(
                      userId: int.tryParse(tf_userid.text.toString()),
                      title: tf_title.text.toString(),
                      body: tf_body.text.toString(),
                    );
                    postSend(model);
                  }
                },
          child: Text("Gönder"),
        ),
      ]),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    super.key,
    required this.hint,
    required this.controller,
  });

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hint,
      ),
    );
  }
}
