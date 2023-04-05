import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/202/service_model.dart';
import 'package:vb_youtube_deneme/product/language_learn.dart';

class MOdelLearnView extends StatefulWidget {
  const MOdelLearnView({super.key});

  @override
  State<MOdelLearnView> createState() => _MOdelLearnViewState();
}

class _MOdelLearnViewState extends State<MOdelLearnView> {
  var postModel =
      PostModel2(userId: 1, id: 1, title: "Title", body: "body" * 5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringItem.postModelAppbar),
      ),
      body: Column(
        children: [
          Text(
              "${postModel.id} \n${postModel.userId} \n${postModel.title} \n${postModel.body}"),
        ],
      ),
    );
  }
}
