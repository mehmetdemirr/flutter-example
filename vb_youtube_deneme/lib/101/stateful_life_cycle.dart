import 'package:flutter/material.dart';

class LifeCycleLearn extends StatefulWidget {
  String message = '';
  LifeCycleLearn({super.key, required this.message});

  @override
  State<LifeCycleLearn> createState() => _LifeCycleLearnState();
}

class _LifeCycleLearnState extends State<LifeCycleLearn> {
  String _message = '';
  late final bool _isodd;

  @override
  void didUpdateWidget(covariant LifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didupdate");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didchange");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _message = widget.message;
    _isodd = _message.length.isOdd;
    tekcift(_isodd);
    print("initstate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  void tekcift(bool tekmi) {
    if (tekmi) {
      _message += 'Tek';
    } else {
      _message += "Çift";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: Column(children: [
        Text(_message),
      ]),
    );
  }
}
