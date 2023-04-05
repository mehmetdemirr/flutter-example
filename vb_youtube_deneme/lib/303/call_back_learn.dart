// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CallbackLearn extends StatefulWidget {
  const CallbackLearn({super.key});

  @override
  State<CallbackLearn> createState() => _CallbackLearnState();
}

class _CallbackLearnState extends State<CallbackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Callabck learn")),
      body: Column(children: const [
        Text("Callback learn"),
      ]),
    );
  }
}

class CallbackUser {
  final int id;
  final String name;

  CallbackUser(this.id, this.name);

  static List<CallbackUser> dummy() {
    CallbackUser u1 = CallbackUser(1, "mehmet");
    CallbackUser u2 = CallbackUser(2, "yusuf");
    CallbackUser u3 = CallbackUser(3, "mustafa");
    List<CallbackUser> user = [];
    user.add(u1);
    user.add(u2);
    user.add(u3);

    return user;
  }

  @override
  bool operator ==(covariant CallbackUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
