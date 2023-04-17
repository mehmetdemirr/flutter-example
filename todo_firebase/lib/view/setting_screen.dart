import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_firebase/utils/constants/padding_items.dart';

import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';
import '../utils/constants/duration_items.dart';
import '../utils/constants/lottie_items.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with TickerProviderStateMixin {
  late bool darkMode;
  String text = "metin" * 20;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: DurationItems.theme.str());
    darkMode = Get.isDarkMode;
    if (darkMode) {
      _controller.animateTo(0.5);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ayarlar".tr)),
      body: Column(children: [
        Padding(
          padding: PaddingItems.small.str(),
          child: ListTile(
            leading: const Icon(Icons.translate),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: PaddingItems.medium.str(),
                  child: Text("dil".tr,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                const _PopUpMenu(),
              ],
            ),
          ),
        ),
        Padding(
          padding: PaddingItems.small.str(),
          child: ListTile(
            leading: const Icon(Icons.light_mode_outlined),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: PaddingItems.medium.str(),
                  child: Text("tema".tr,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("tema_secin".tr,
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          darkMode
                              ? _controller.animateTo(1)
                              : _controller.animateTo(0.5);
                          darkMode = !darkMode;
                          Get.changeTheme(darkMode ? darkTheme : lightTheme);
                        },
                        child: Lottie.asset(
                          LottieItems.theme.str(),
                          fit: BoxFit.cover,
                          repeat: false,
                          controller: _controller,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class _PopUpMenu extends StatelessWidget {
  const _PopUpMenu();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              const Icon(Icons.language_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(
                "tr".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              const Icon(Icons.language_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(
                "en".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              const Icon(Icons.language_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(
                "de".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Row(
            children: [
              const Icon(Icons.language_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(
                "es".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 1:
            {
              Get.updateLocale(const Locale("tr_TR"));
              break;
            }
          case 2:
            {
              Get.updateLocale(const Locale("en_US"));
              break;
            }
          case 3:
            {
              Get.updateLocale(const Locale("de_De"));
              break;
            }
          case 4:
            {
              Get.updateLocale(const Locale("es_Es"));
              break;
            }
        }
      },
      child:
          Text("dil_secin".tr, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
