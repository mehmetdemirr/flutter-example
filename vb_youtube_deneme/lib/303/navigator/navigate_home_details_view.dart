import 'package:flutter/material.dart';

class NavigateHomeDetails extends StatefulWidget {
  const NavigateHomeDetails({super.key, this.id});

  final String? id;

  @override
  State<NavigateHomeDetails> createState() => _NavigateHomeDetailsState();
}

class _NavigateHomeDetailsState extends State<NavigateHomeDetails> {
  String _id = "";
  bool textVisible = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final modelId = ModalRoute.of(context)?.settings.arguments;
      setState(() {
        modelId is String ? _id = modelId.toString() : _id = widget.id ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("home view details")),
      body: Column(children: [
        const Text("home view details"),
        Visibility(visible: textVisible, child: Text("id :$_id")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                textVisible = !textVisible;
              });
            },
            child: const Text("Göster")),
      ]),
    );
  }
}
