import 'package:flutter/material.dart';
import 'package:sosyal_medya/product/color_items.dart';
import 'package:sosyal_medya/product/mediaQuery.dart';
import 'package:sosyal_medya/product/padding_items.dart';

class ReelsSayfa extends StatefulWidget {
  ReelsSayfa({super.key, required this.bottomHeight});

  final double bottomHeight;

  @override
  State<ReelsSayfa> createState() => _ReelsSayfaState();
}

class _ReelsSayfaState extends State<ReelsSayfa> {
  final List<String> videoList = [];
  final ScrollController _controller = ScrollController();

  void _animateToIndex(int index, double height) {
    _controller.animateTo(
      index * height,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<void> onRefresh() async {
    return Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        // burda bu çalışmadı !!!!!!!!!!!!!
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onVerticalDragEnd: (DragEndDetails details) {
                  //yukarıdaki gönderi
                  if (details.velocity.pixelsPerSecond.dy > 0 && index != 0) {
                    print('Aşağı kaydırıldı // yukarıdaki gönderi');
                    _animateToIndex(
                        index - 1,
                        (context.height -
                            widget.bottomHeight -
                            statusBarHeight));
                  }
                  //aşığıdaki gönderi
                  else if (details.velocity.pixelsPerSecond.dy < 0) {
                    print("Yukarı kaydıldı // aşığıdaki gönderi");
                    _animateToIndex(
                        index + 1,
                        (context.height -
                            widget.bottomHeight -
                            statusBarHeight));
                  } else {
                    // Kullanıcı hiçbir yere kaydırmadı.
                    print('Kaydırma yok');
                  }
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      height: context.height -
                          widget.bottomHeight -
                          statusBarHeight,
                      child: Container(
                        child: Image.asset(
                          "assets/images/manzara.jpeg",
                          fit: BoxFit.cover,
                        ),
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: PaddingItems.horizontals + PaddingItems.bottoml,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: PaddingItems.bottoms,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "100",
                                          style: TextStyle(
                                              color: ColorItems.reelsTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: PaddingItems.bottoms / 2,
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.comment,
                                          color: Colors.white,
                                        ),
                                        Text("5",
                                            style: TextStyle(
                                                color:
                                                    ColorItems.reelsTextColor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        'https://picsum.photos/id/${index + 20}/200/200'),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Kullanıcı Adı $index',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
