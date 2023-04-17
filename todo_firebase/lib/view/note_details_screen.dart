import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_firebase/model/not_model.dart';
import 'package:todo_firebase/routes/routes.dart';
import 'package:todo_firebase/utils/constants/lottie_items.dart';
import 'package:todo_firebase/utils/constants/padding_items.dart';
import 'package:todo_firebase/utils/widgets/not_snackbar.dart';
import 'package:todo_firebase/view/note_update_screen.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({super.key, required this.not});
  final Not not;

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  late NotModel _not;
  @override
  void initState() {
    super.initState();
    _not = widget.not.not;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("not_detay".tr),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: double.maxFinite,
                child: Column(children: [
                  SizedBox(
                    width: context.width / 3,
                    child: _not.notTamamla
                        ? Lottie.asset(LottieItems.success.str())
                        : Lottie.asset(LottieItems.unsuccess.str()),
                  ),
                  Padding(
                    padding: PaddingItems.small.str(),
                    child: Container(
                      width: context.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "not_baslik".tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Padding(
                            padding: PaddingItems.small.str() / 3,
                            child: Text(
                              _not.notBaslik,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: PaddingItems.small.str(),
                    child: Container(
                      width: context.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "not_icerik".tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Padding(
                            padding: PaddingItems.small.str() / 3,
                            child: Text(
                              _not.notIcerik,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Positioned(
              bottom: 50,
              width: context.width,
              child: Padding(
                padding: PaddingItems.horizantalLarge.str() * 1.5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          snackbar("not_tamamlandı".tr, "");
                          NotModel.notGuncelle(
                              widget.not.key,
                              NotModel(
                                  notId: _not.notId,
                                  notBaslik: _not.notBaslik,
                                  notIcerik: _not.notIcerik,
                                  notTamamla: true));
                        },
                        child: Container(
                          width: context.width / 6,
                          height: context.width / 6,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.task_alt_outlined,
                            size: 50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("*sonra güncelle");
                          Get.off(() => NoteUpdateScreen(not: widget.not));
                        },
                        child: Container(
                          width: context.width / 6,
                          height: context.width / 6,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.app_registration_outlined,
                            size: 50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          snackbar("not_sil".tr, "");
                          NotModel.notSil(
                            widget.not.key,
                          );
                          Get.offAllNamed(RoutesClass.home);
                        },
                        child: Container(
                          width: context.width / 6,
                          height: context.width / 6,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            size: 50,
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}
