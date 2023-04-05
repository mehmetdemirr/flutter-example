import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn>
    with TickerProviderStateMixin {
  bool _isVisibility = true;
  bool _isAlpha = true;
  bool _isColor = true;
  bool _isContainerColor = true;
  bool _isContainerHeight = true;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  void changeVisibilty() {
    setState(() {
      _isVisibility = !_isVisibility;
    });
  }

  void changeAlpha() {
    setState(() {
      _isAlpha = !_isAlpha;
    });
  }

  void changeColor() {
    setState(() {
      _isColor = !_isColor;
    });
  }

  void changeContainerColor() {
    setState(() {
      _isContainerColor = !_isContainerColor;
    });
  }

  void changeContainerWidth() {
    setState(() {
      _isContainerHeight = !_isContainerHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //Text("Animated Learn",style:Theme.of(context).textTheme.displaySmall),
          AnimatedCrossFadeWidget(isVisibility: _isVisibility),
          _AnimatedCrossFade(),
          _AnimatedOpacity(),
          _AnimatedDefaultTextStyle(),
          ElevatedButton(
            onPressed: () {
              changeColor();
            },
            child: const Text("Change Color"),
          ),
          _AnimatedIcon(),
          _AnimatedContainer(),
          ElevatedButton(
            onPressed: () {
              changeContainerColor();
            },
            child: const Text("Container renk değiştir"),
          ),
          ElevatedButton(
            onPressed: () {
              changeContainerWidth();
            },
            child: const Text("Container width sıfırla"),
          ),
          Expanded(
            child: _AnimatedList(),
          ),
          Expanded(
            child: Stack(
              children: const [
                AnimatedPositioned(
                    duration: Duration(seconds: 2), child: Text("mehmet"))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisibilty();
          _animationController.animateTo(1);
        },
        child: Icon(_isVisibility
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined),
      ),
    );
  }

  AnimatedList _AnimatedList() {
    return AnimatedList(
      initialItemCount: 10,
      itemBuilder: (context, index, animation) {
        return const Card(
          child: Text("Mehmet"),
        );
      },
    );
  }

  AnimatedContainer _AnimatedContainer() {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      color: _isContainerColor ? Colors.red : Colors.blue,
      width: 100,
      height: _isContainerHeight ? 0 : 100,
    );
  }

  AnimatedIcon _AnimatedIcon() {
    return AnimatedIcon(
      icon: AnimatedIcons.add_event,
      progress: _animationController,
    );
  }

  AnimatedDefaultTextStyle _AnimatedDefaultTextStyle() {
    return AnimatedDefaultTextStyle(
      style: _isColor
          ? const TextStyle(color: Colors.red)
          : const TextStyle(color: Colors.green),
      duration: const Duration(seconds: 1),
      child: const Text("Animated Default Text Style"),
    );
  }

  AnimatedOpacity _AnimatedOpacity() {
    return AnimatedOpacity(
      opacity: _isAlpha ? 1 : 0.45,
      duration: const Duration(seconds: 2),
      child: const Text("Animated Opacity"),
    );
  }

  ListTile _AnimatedCrossFade() {
    return ListTile(
        title: AnimatedCrossFade(
          duration: const Duration(seconds: 1),
          crossFadeState:
              _isAlpha ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: const Text("Data"),
          // ignore: prefer_const_constructors
          secondChild: Opacity(
            opacity: 0.45,
            child: const Text("Data"),
          ),
        ),
        trailing: IconButton(
            onPressed: () {
              changeAlpha();
            },
            icon: const Icon(Icons.access_alarms)));
  }
}

class AnimatedCrossFadeWidget extends StatelessWidget {
  const AnimatedCrossFadeWidget({
    super.key,
    required bool isVisibility,
  }) : _isVisibility = isVisibility;

  final bool _isVisibility;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      crossFadeState:
          _isVisibility ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: const Placeholder(),
      secondChild: const SizedBox(),
    );
  }
}
