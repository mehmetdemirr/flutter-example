import 'package:flutter/material.dart';

class LoadingButoon extends StatefulWidget {
  const LoadingButoon(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final Future<void> Function() onPressed;

  @override
  State<LoadingButoon> createState() => _LoadingButoonState();
}

class _LoadingButoonState extends State<LoadingButoon> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          if (isLoading) {
            return;
          }
          setState(() async {
            changeLoading();
            await widget.onPressed.call();
            changeLoading();
          });
        },
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(widget.title));
  }
}
