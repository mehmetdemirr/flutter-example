import 'package:flutter/material.dart';

import '../model/resources_model.dart';
import '../service/reqrest_service.dart';

class ReqRestProvider extends ChangeNotifier {
  final IReqesService reqesService;
  List<Data>? dataList = [];
  bool isLoading = false;

  ReqRestProvider(this.reqesService) {
    listFetch();
  }
  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> listFetch() async {
    changeLoading();
    dataList = (await reqesService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
