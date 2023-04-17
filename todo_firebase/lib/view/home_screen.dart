import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/routes/routes.dart';

import '../model/not_model.dart';
import '../utils/widgets/not_card.dart';
import 'note_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Not> notListesi = [];
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        fetchNotList();
      });
    });
  }

  Future<void> fetchNotList() async {
    notListesi = await NotModel.tumNotlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app_name".tr),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(RoutesClass.setting);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      // body: Column(children: [
      //   ElevatedButton(
      //       onPressed: () {
      //         Kisiler.kisiEkle("abdüssamed", 6);
      //       },
      //       child: const Text("ekle")),
      //   ElevatedButton(
      //       onPressed: () {
      //         Kisiler.kisiSil("-NT9Hc2jgvS6JmOsw5Sj");
      //       },
      //       child: const Text("Sil")),
      //   ElevatedButton(
      //       onPressed: () {
      //         Kisiler.kisiGuncelle("me", 7, "-NT9Hp5LRpaU1qsq-ENy");
      //       },
      //       child: const Text("Güncelle")),
      //   ElevatedButton(
      //       onPressed: () {
      //         Kisiler.kisileriGeti();
      //       },
      //       child: const Text("kisileri yazdır")),
      //   ElevatedButton(
      //       onPressed: () {
      //         Kisiler.kisileriGetirBirKer();
      //       },
      //       child: const Text("kisileri tek bi sefer yazdır")),
      //   ElevatedButton(
      //       onPressed: () {
      //         Kisiler.kisilerSorgu();
      //       },
      //       child: const Text("sorgu")),
      // ]),
      body: NotListViewBuilder(
        notListesi: notListesi,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RoutesClass.notAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotListViewBuilder extends StatelessWidget {
  const NotListViewBuilder({
    super.key,
    required this.notListesi,
  });

  final List<Not> notListesi;

  @override
  Widget build(BuildContext context) {
    return notListesi.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: notListesi.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print("*sonra güncelle");
                  Get.to(() => NoteDetailsScreen(not: notListesi[index]));
                },
                child: NoteCard(not: notListesi[index]),
              );
            });
  }
}
