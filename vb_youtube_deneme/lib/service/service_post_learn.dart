import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';
import 'package:dio/dio.dart';
import 'package:vb_youtube_deneme/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  var userid_tf = TextEditingController();
  var body_tf = TextEditingController();
  var title_tf = TextEditingController();
  late final Dio networkManager;
  final String baseUrl = "https://jsonplaceholder.typicode.com/";
  final String url = "https://jsonplaceholder.typicode.com/posts";

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void addPostItem(PostModel model) async {
    changeLoading();
    final response = await networkManager.post(
      "posts",
      data: model,
    );
    if (response.statusCode == HttpStatus.created) {
      print("sonuç : $response");
    }
    changeLoading();
  }

  @override
  void initState() {
    // TODO: implement initState
    networkManager = Dio(BaseOptions(baseUrl: baseUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Post Learn"),
        actions: [
          isLoading ? CircularProgressIndicator.adaptive() : SizedBox(),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: PaddingItems.all,
          child: TextField(
            controller: userid_tf,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "User id",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: PaddingItems.all,
          child: TextField(
            controller: title_tf,
            decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: PaddingItems.all,
          child: TextField(
            controller: body_tf,
            decoration: InputDecoration(
                hintText: "Body",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        ElevatedButton(
          onPressed: isLoading
              ? null
              : () async {
                  if (title_tf.text.isNotEmpty &&
                      userid_tf.text.isNotEmpty &&
                      body_tf.text.isNotEmpty) {
                    final model = PostModel(
                      userId: int.tryParse(userid_tf.text.toString()),
                      body: body_tf.text.toString(),
                      title: title_tf.text.toString(),
                    );

                    addPostItem(model);
                  }
                },
          child: Text("Send"),
        ),
      ]),
    );
  }
}
