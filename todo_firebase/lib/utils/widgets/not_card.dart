import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/not_model.dart';
import '../../view/note_update_screen.dart';
import 'not_snackbar.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.not,
  });

  final Not not;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Row(
        children: [
          not.not.notBaslik.length > 40
              ? Text(
                  "${not.not.notBaslik.substring(0, 40)}...",
                )
              : Text(
                  not.not.notBaslik,
                ),
          const Spacer(),
          // not.notTamamla
          //     ? const Icon(Icons.task_alt_outlined)
          //     : const Icon(Icons.cancel_outlined),
          PopupMenuButton(
            child: const Icon(Icons.more_vert_outlined),
            itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      const Icon(Icons.task_alt_outlined),
                      Text("not_tamamla".tr),
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      const Icon(Icons.app_registration_outlined),
                      Text(
                        "not_guncelle".tr,
                      ),
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outline_outlined),
                      Text("not_sil".tr),
                    ],
                  )),
            ],
            onSelected: (value) async {
              switch (value) {
                case 1:
                  {
                    snackbar("not_tamamlandı".tr, "");
                    await NotModel.notGuncelle(
                        not.key,
                        NotModel(
                            notId: not.not.notId,
                            notBaslik: not.not.notBaslik,
                            notIcerik: not.not.notIcerik,
                            notTamamla: true));
                    break;
                  }
                case 2:
                  {
                    print("*sonra güncelle");
                    Get.to(() => NoteUpdateScreen(not: not));
                    break;
                  }
                case 3:
                  {
                    snackbar("not_silindi".tr, "");
                    await NotModel.notSil(
                      not.key,
                    );
                    break;
                  }
              }
            },
          ),
        ],
      ),
      subtitle: not.not.notIcerik.length > 210
          ? Text(
              "${not.not.notIcerik.substring(0, 209)}...",
            )
          : Text(
              not.not.notIcerik,
            ),
    ));
  }
}
