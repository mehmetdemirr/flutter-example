import 'package:flutter/material.dart';

import 'state_view_model.dart';

class StateManager extends StatefulWidget {
  const StateManager({super.key});

  @override
  State<StateManager> createState() => _StateManagerState();
}

class _StateManagerState extends SayacViewModel {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Text(
          "Sayaç : $sayac",
          style: Theme.of(context).textTheme.headlineMedium,
        )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sayacArttir();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
