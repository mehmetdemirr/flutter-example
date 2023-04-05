import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/product/padding_learn.dart';

class FormLearn extends StatefulWidget {
  const FormLearn({super.key});

  @override
  State<FormLearn> createState() => _FormLearnState();
}

class _FormLearnState extends State<FormLearn> {
  TextEditingController _kaController = TextEditingController();
  TextEditingController _poralaController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Learn"),
      ),
      body: Column(children: [
        const Text("FormLearn"),
        Form(
            key: _key,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                Padding(
                  padding: PaddingItems.horizontal + PaddingItems.vertical,
                  child: TextFormField(
                    controller: _kaController,
                    decoration: InputDecoration(
                      hintText: "Kullanıcı Adınızı giriniz",
                      labelText: "Kullanıcı Ad",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Lütfen Kullanıcı adınızı giriniz";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: PaddingItems.horizontal + PaddingItems.vertical,
                  child: TextFormField(
                    controller: _poralaController,
                    obscureText: true,
                    obscuringCharacter: '#',
                    decoration: InputDecoration(
                      hintText: "Parolanızı giriniz",
                      labelText: "Parola",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if ((_key.currentState?.validate() ?? false)) {
                       print("devam");
                    } else {
                      print("hata");
                    }
                  },
                  child: Text("Giriş"),
                ),
              ],
            ))
      ]),
    );
  }
}
