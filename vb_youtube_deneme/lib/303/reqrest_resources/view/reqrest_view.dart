import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:vb_youtube_deneme/303/reqrest_resources/service/reqrest_service.dart';
import 'package:vb_youtube_deneme/303/reqrest_resources/viewModel/reqrest_provider.dart';

class ReqrestView extends StatefulWidget {
  const ReqrestView({super.key});

  @override
  _ReqrestViewState createState() => _ReqrestViewState();
}

class _ReqrestViewState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqRestProvider>(
      create: (context) => ReqRestProvider(
          ReqrestService(Dio(BaseOptions(baseUrl: "https://reqres.in/api")))),
      builder: (context, child) {
        return _body(context.watch<ReqRestProvider>().isLoading,
            context.watch<ReqRestProvider>().dataList);
      },
    );
  }

  Scaffold _body(bool isLoading, List? dataList) {
    return Scaffold(
      appBar: AppBar(title: const Text("veri çek")),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataList?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                    child: Text(dataList?[index].firstName ?? "mehmet"));
              }),
    );
  }
}
