import 'package:flutter/material.dart';
import 'package:sosyal_medya/product/color_items.dart';
import 'package:sosyal_medya/product/mediaQuery.dart';
import 'package:sosyal_medya/product/padding_items.dart';
import 'package:sosyal_medya/product/string_items.dart';

import '../model/post.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  //sayfa yenilendiğinde çalışacak  olan fonksiyon
  Future<void> onRefresh() async {
    return Future.delayed(const Duration(seconds: 1));
  }

  List<Post>? postList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringItems.bottom_appbar,
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.tabController.animateTo(1);
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: (postList == null || postList?.length == 0)
            ? const Center(
                child: Text(
                  "Gönderi Bulunamadı",
                ),
              )
            : ListView.builder(
                itemCount: postList?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return PostCard(post: postList?[index]);
                }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorItems.homeFloatButton,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});
  final Post? post;
  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool begeni = false;
  bool kaydet = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const KullaniciWidget(),
        SizedBox(
          height: context.height / 3,
          width: context.width,
          child: Image.asset("assets/images/manzara.jpeg"),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    begeni = !begeni;
                  });
                },
                icon: begeni
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border_outlined)),
            IconButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: context.height / 2,
                        child: MyShowBottomWidget(),
                      );
                    });
              },
              icon: Icon(Icons.comment_bank_outlined),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  setState(() {
                    kaydet = !kaydet;
                  });
                },
                icon: kaydet
                    ? const Icon(
                        Icons.bookmark,
                        color: Colors.black,
                      )
                    : const Icon(Icons.bookmark_outline)),
          ],
        )
      ]),
    );
  }
}

//yorumları gösterme
class MyShowBottomWidget extends StatelessWidget {
  const MyShowBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return YorumCard(
                index: index,
              );
            },
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: StringItems.yorumYaz,
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
          ),
        ),
      ],
    );
  }
}

class YorumCard extends StatelessWidget {
  const YorumCard({
    super.key,
    required this.index,
  });

  final index;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingItems.tops,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KullaniciWidget(),
          Padding(
            padding: PaddingItems.horizontall,
            child: Text("Yorum $index"),
          ),
        ],
      ),
    );
  }
}

class KullaniciWidget extends StatelessWidget {
  const KullaniciWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: ColorItems.kullaniciFotograf,
          child: Icon(Icons.person),
        ),
        const Padding(
          padding: PaddingItems.horizontals,
          child: Text(StringItems.kullaniciAd),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ],
    );
  }
}
