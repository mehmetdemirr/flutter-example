import 'package:flutter/material.dart';
import 'package:sosyal_medya/model/post.dart';
import 'package:sosyal_medya/product/mediaQuery.dart';
import 'package:sosyal_medya/product/padding_items.dart';
import 'package:sosyal_medya/product/string_items.dart';
import 'package:sosyal_medya/view/ayarlar.dart';
import 'package:sosyal_medya/view/profil_duzenle.dart';

class ProfilSayfa extends StatefulWidget {
  const ProfilSayfa({super.key});

  @override
  State<ProfilSayfa> createState() => _ProfilSayfaState();
}

class _ProfilSayfaState extends State<ProfilSayfa>
    with TickerProviderStateMixin {
  late final TabController controller;

  Future<void> onRefresh() async {
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  List<Post>? kaydedilenListesi = [];
  List<Post>? gonderiListesi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringItems.kullaniciAd),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              StringItems.cikisYap,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(children: [
            //profil fotoğrafı , gönderi, takipçi ve takip
            // ignore: prefer_const_constructors
            Padding(
              padding: PaddingItems.tops,
              child: const ProfilUstRow(),
            ),

            // profil düzenle ve ayarlar butonu
            // ignore: prefer_const_constructors
            Padding(
              padding: PaddingItems.tops,
              child: const ProfilDuzunleAyarlarButton(),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Padding(
              padding: PaddingItems.topl,
              child: Tab_Bar(controller: controller),
            ),
            SizedBox(
              height: 600,
              child: Tab_Bar_View(
                controller: controller,
                gonderiListesi: gonderiListesi,
                kaydedilenlerListesi: kaydedilenListesi,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Tab_Bar_View extends StatelessWidget {
  const Tab_Bar_View({
    super.key,
    required this.controller,
    required this.gonderiListesi,
    required this.kaydedilenlerListesi,
  });

  final List<Post>? gonderiListesi;
  final List<Post>? kaydedilenlerListesi;

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TabGonderi(
            postList: gonderiListesi,
          ),
          TabGonderi(
            postList: kaydedilenlerListesi,
          ),
        ]);
  }
}

// ignore: camel_case_types
class Tab_Bar extends StatelessWidget {
  const Tab_Bar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: Colors.blue,
        controller: controller,
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          // ignore: prefer_const_constructors
          Tab(
            text: StringItems.gonderiler,
          ),
          // ignore: prefer_const_constructors
          Tab(
            text: StringItems.kaydedilenler,
          ),
        ]);
  }
}

//profildeki iki tane button
class ProfilDuzunleAyarlarButton extends StatelessWidget {
  const ProfilDuzunleAyarlarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: context.width / 3,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilDuzenleSayfa()));
            },
            child: const Text(StringItems.profilDuzenle),
          ),
        ),
        SizedBox(
          width: context.width / 3,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AyarlarSayfa()));
            },
            child: const Text(StringItems.ayarlar),
          ),
        ),
      ],
    );
  }
}

//profil kısmının üst kısmı
class ProfilUstRow extends StatelessWidget {
  const ProfilUstRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: PaddingItems.horizontals,
          child: SizedBox(
            width: context.width / 4,
            height: context.height / 7,
            child: const CircleAvatar(
              backgroundImage:
                  NetworkImage('https://picsum.photos/id/1/200/200'),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: PaddingItems.horizontals,
            child: Text(
              "özet" * 100,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class TabGonderi extends StatelessWidget {
  const TabGonderi({super.key, required this.postList});

  final List<Post>? postList;
  @override
  Widget build(BuildContext context) {
    return (postList?.length == 0 || postList == null)
        ? const Center(
            child: Text(StringItems.gonderiYok),
          )
        : GridView.builder(
            itemCount: postList?.length ?? 0,
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
                  Text("${postList?[index].postId}"),
                ]),
              );
            },
          );
  }
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
