import 'package:flutter/material.dart';

class TabBarLearn extends StatefulWidget {
  const TabBarLearn({super.key});

  @override
  State<TabBarLearn> createState() => _TabBarLearnState();
}

class _TabBarLearnState extends State<TabBarLearn> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: TabBar(
            physics: NeverScrollableScrollPhysics(),
            tabs: [
              Tab(
                text: "mehmet",
              ),
              Tab(
                text: "mehmet",
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Tab Bar Learn"),
          bottom: TabBar(tabs: [
            Tab(
              text: "mehmet",
            ),
            Tab(
              text: "mehmet",
            ),
          ]),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
        ]),
      ),
    );
  }
}
