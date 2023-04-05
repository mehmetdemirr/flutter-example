import 'package:flutter/material.dart';
import 'package:sosyal_medya/product/mediaQuery.dart';
import 'package:sosyal_medya/product/padding_items.dart';
import 'package:sosyal_medya/product/string_items.dart';

class AramaSayfa extends StatefulWidget {
  const AramaSayfa({super.key});

  @override
  State<AramaSayfa> createState() => _AramaSayfaState();
}

class _AramaSayfaState extends State<AramaSayfa> {
  Future<void> onRefresh() async {
    return Future.delayed(Duration(seconds: 3));
  }

  var aramatf = TextEditingController();
  var arama_aktif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: PaddingItems.horizontals +
              PaddingItems.topl * 2 +
              const EdgeInsets.only(bottom: 0),
          child: TextField(
            controller: aramatf,
            //     custom textfield karakter sayıcı
            // maxLength: 30, //en fazla 30 karakter ile arama yapmak
            // buildCounter: (context,
            //     {required currentLength,
            //     required isFocused,
            //     required maxLength}) {
            //   return Text("$currentLength/$maxLength");
            // },
            decoration: InputDecoration(
                hintText: "${StringItems.arama}",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: GridView.builder(
              //itemCount: 100,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5 / 5,
                crossAxisCount: GridCounter(context),
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: PaddingItems.card,
                  child: Column(children: [
                    Text("metinn $index"),
                  ]),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  int GridCounter(BuildContext context) {
    double genislik = context.width;
    if (genislik <= 150) {
      return 1;
    } else if (genislik <= 300) {
      return 2;
    } else if (genislik <= 600) {
      return 3;
    } else if (genislik <= 900) {
      return 4;
    } else if (genislik <= 1100) {
      return 5;
    } else if (genislik <= 1300) {
      return 6;
    } else {
      return 7;
    }
  }
}
