import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/model/not_model.dart';

import '../routes/routes.dart';
import '../utils/constants/padding_items.dart';
import '../utils/widgets/not_snackbar.dart';

class NoteUpdateScreen extends StatefulWidget {
  const NoteUpdateScreen({super.key, required this.not});
  final Not not;

  @override
  State<NoteUpdateScreen> createState() => _NoteUpdateScreenState();
}

class _NoteUpdateScreenState extends State<NoteUpdateScreen> {
  final TextEditingController _controllerNotBaslik = TextEditingController();
  final TextEditingController _controllerNotIcerik = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool notTamamla = false;
  late NotModel _not;

  @override
  void initState() {
    super.initState();
    _not = widget.not.not;
    _controllerNotBaslik.text = _not.notBaslik;
    _controllerNotIcerik.text = _not.notIcerik;
    notTamamla = _not.notTamamla;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("not_guncelle".tr),
        actions: [
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  snackbar("not_guncellendi".tr, "");
                  Get.offAllNamed(RoutesClass.home);
                  String notBaslik = _controllerNotBaslik.text;
                  String notIcerik = _controllerNotIcerik.text;
                  bool notYapildiMi = notTamamla;
                  NotModel.notGuncelle(
                      widget.not.key,
                      NotModel(
                          notId: 1,
                          notBaslik: notBaslik,
                          notIcerik: notIcerik,
                          notTamamla: notTamamla));
                }
              },
              child: Text(
                "guncelle".tr,
                style: Theme.of(context).textTheme.titleMedium,
              )),
        ],
      ),
      body: Column(children: [_form(context)]),
    );
  }

  Form _form(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: PaddingItems.small.str(),
              child: TextFormField(
                  maxLines: 5,
                  minLines: 1,
                  controller: _controllerNotBaslik,
                  cursorColor: Theme.of(context).secondaryHeaderColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "not_baslik_bos".tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "not_baslik".tr,
                    labelText: "not_baslik".tr,
                    labelStyle: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withAlpha(70)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withAlpha(70)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context)
                              .colorScheme
                              .error
                              .withAlpha(200)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  )),
            ),
            Padding(
              padding: PaddingItems.small.str(),
              child: TextFormField(
                  maxLines: 15,
                  minLines: 3,
                  controller: _controllerNotIcerik,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "not_icerik_bos".tr;
                    }
                    return null;
                  },
                  cursorColor: Theme.of(context).secondaryHeaderColor,
                  decoration: InputDecoration(
                    hintText: "not_icerik".tr,
                    labelText: "not_icerik".tr,
                    labelStyle: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withAlpha(70)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context)
                              .secondaryHeaderColor
                              .withAlpha(70)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context)
                              .colorScheme
                              .error
                              .withAlpha(200)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 3,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  )),
            ),
            Padding(
              padding: PaddingItems.leftLarge.str(),
              child: Row(
                children: [
                  Text(
                    "Yapıldı mı?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Checkbox(
                      value: notTamamla,
                      onChanged: (value) {
                        setState(() {
                          notTamamla = value!;
                        });
                      }),
                  // Switch(
                  //     value: notTamamla,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         notTamamla = value;
                  //       });
                  //     })
                ],
              ),
            ),
          ],
        ));
  }
}
