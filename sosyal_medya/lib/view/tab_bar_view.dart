import 'package:flutter/material.dart';
import 'package:sosyal_medya/view/home.dart';
import 'package:sosyal_medya/view/notification.dart';

class TabBarViews extends StatefulWidget {
  const TabBarViews({super.key});

  @override
  State<TabBarViews> createState() => _TabBarViewsState();
}

class _TabBarViewsState extends State<TabBarViews>
    with TickerProviderStateMixin {
  late final TabController tab_controller;
  @override
  void initState() {
    super.initState();
    tab_controller = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(controller: tab_controller, children: [
          AnaSayfa(
            tabController: tab_controller,
          ),
          const BildirimSayfasi(),
        ]),
      ),
    );
  }
}
