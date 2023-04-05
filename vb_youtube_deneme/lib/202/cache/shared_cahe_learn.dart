import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vb_youtube_deneme/202/cache/shared_manager.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';

class SharedCacheLearn extends StatefulWidget {
  const SharedCacheLearn({super.key});

  @override
  State<SharedCacheLearn> createState() => _SharedCacheLearnState();
}

class _SharedCacheLearnState extends State<SharedCacheLearn> {
  final TextEditingController _girdiController = TextEditingController();
  String? _deger = " ";

  Future<void> fetchDeger() async {
    _deger = await SharedManager().getData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDeger();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences Learn Dart"),
      ),
      body: Column(children: [
        const Text("Shared Prefrences "),
        Padding(
          padding: PaddingItems.all,
          child: TextField(
            controller: _girdiController,
            decoration: const InputDecoration(
              hintText: "Metin Giriniz",
              labelText: "Girdi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        Text("Değer:${_deger ?? 'deger gelmedi'}"),
        ElevatedButton(
          onPressed: () async {
            // Obtain shared preferences.
            await SharedManager().setData(_girdiController.text.toString());
            setState(() {
              fetchDeger();
            });
          },
          child: Text("Kaydet"),
        ),
      ]),
    );
  }
}
