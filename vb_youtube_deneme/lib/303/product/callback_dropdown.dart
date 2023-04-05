import 'package:flutter/material.dart';

import '../call_back_learn.dart';

class CallbackDoropdown extends StatefulWidget {
  const CallbackDoropdown({super.key, required this.onSelected});

  final void Function(CallbackUser user) onSelected;
  @override
  State<CallbackDoropdown> createState() => _CallbackDoropdownState();
}

class _CallbackDoropdownState extends State<CallbackDoropdown> {
  CallbackUser? user;

  void _updateUser(CallbackUser? item) {
    setState(() {
      user = item;
    });
    if (user != null) {
      widget.onSelected.call(user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: user,
        items: CallbackUser.dummy().map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.name),
          );
        }).toList(),
        onChanged: _updateUser);
  }
}
