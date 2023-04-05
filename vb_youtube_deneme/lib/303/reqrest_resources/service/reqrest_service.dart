import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vb_youtube_deneme/303/reqrest_resources/model/resources_model.dart';

abstract class IReqesService {
  final Dio dio;
  IReqesService(this.dio);
  Future<ResourcesModel?> fetchResourceItem();
}

class ReqrestService extends IReqesService {
  ReqrestService(super.dio);

  @override
  Future<ResourcesModel?> fetchResourceItem() async {
    final response = await dio.get(ReqrestPath.dataList.toStr());
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourcesModel.fromJson(jsonBody);
      }
      return null;
    }
    return null;
  }
}

enum ReqrestPath {
  dataList;
}

extension reqrestPath on ReqrestPath {
  String toStr() {
    switch (this) {
      case ReqrestPath.dataList:
        return "/users?page=2";
    }
  }
}
