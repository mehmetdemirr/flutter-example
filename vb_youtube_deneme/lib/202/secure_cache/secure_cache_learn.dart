import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/202/secure_cache/secure_cache_manager.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';

class SecureCacheLearn extends StatefulWidget {
  const SecureCacheLearn({super.key});

  @override
  State<SecureCacheLearn> createState() => _SecureCacheLearnState();
}

class _SecureCacheLearnState extends State<SecureCacheLearn> {
  String girdi = "";

  Future<void> girdiSave(String data) async {
    await SecureCacheManager().setCounter(data);
    setState(() {});
  }

  Future<void> girdiFetch() async {
    girdi = await SecureCacheManager().getCounter();
    setState(() {});
  }

  TextEditingController girdiTf = TextEditingController();
  @override
  void initState() {
    super.initState();
    girdiFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Cache Example"),
      ),
      body: Column(children: [
        const Text("Example Secure Cache"),
        Padding(
          padding: PaddingItems.all,
          child: TextField(
            controller: girdiTf,
            decoration: const InputDecoration(
              hintText: "Metin yazın",
              labelText: "Girdi",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await girdiSave(girdiTf.text.toString());
              await girdiFetch();
            },
            child: const Text("Girdi Kaydet")),
        Text("Girdi:$girdi"),
      ]),
    );
  }
}
