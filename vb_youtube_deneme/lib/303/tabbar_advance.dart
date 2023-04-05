import 'package:flutter/material.dart';

class TabbarAdvance extends StatefulWidget {
  const TabbarAdvance({super.key});

  @override
  State<TabbarAdvance> createState() => _TabbarAdvanceState();
}

class _TabbarAdvanceState extends State<TabbarAdvance> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Tabbar Advance"),
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("bir"),
              ),
              Tab(
                child: Text("bir"),
              ),
              Tab(
                child: Text("bir"),
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.black12,
              ),
            ],
          )),
    );
  }
}
