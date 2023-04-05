import 'package:flutter/material.dart';
import 'package:vb_youtube_deneme/extension/mediaquery.dart';

class TabbarDeneme extends StatefulWidget {
  const TabbarDeneme({super.key});

  @override
  State<TabbarDeneme> createState() => _TabbarDenemeState();
}

class _TabbarDenemeState extends State<TabbarDeneme>
    with TickerProviderStateMixin {
  late final TabController tab_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tab_controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text("Tabbar Deneme"),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tab_controller,
            children: [
              s1(),
              s2(),
            ]),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: TabBar(
              indicatorColor: Colors.white,
              splashBorderRadius: BorderRadius.circular(20),
              controller: tab_controller,
              tabs: [
                Tab(
                  text: "sayfa1",
                ),
                Tab(
                  text: "sayfa2",
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            tab_controller.animateTo(0);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class s1 extends StatefulWidget {
  const s1({super.key});

  @override
  State<s1> createState() => _s1State();
}

class _s1State extends State<s1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                width: context.width / 2,
                height: context.height / 5,
              ),
              Container(
                color: Colors.red,
                width: context.width / 2,
                height: context.height / 5,
              ),
              Container(
                color: Colors.blue,
                width: context.width / 2,
                height: context.height / 5,
              ),
              Container(
                color: Colors.red,
                width: context.width / 2,
                height: context.height / 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class s2 extends StatefulWidget {
  const s2({super.key});

  @override
  State<s2> createState() => _s2State();
}

class _s2State extends State<s2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green),
    );
  }
}
