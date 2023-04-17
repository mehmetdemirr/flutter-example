import 'package:get/get.dart';
import 'package:todo_firebase/utils/constants/duration_items.dart';
import 'package:todo_firebase/view/home_screen.dart';
import 'package:todo_firebase/view/note_add_screen.dart';
import 'package:todo_firebase/view/setting_screen.dart';
import 'package:todo_firebase/view/splash_screen.dart';

class RoutesClass {
  static String home = "/";
  static String splash = "/splash";
  static String setting = "/setting";
  static String notAdd = "/not_add";
  static String notUpdate = "/not_update";
  static String notDetails = "/not_details";

  static List<GetPage> routes = [
    GetPage(
        name: RoutesClass.home,
        page: () {
          return const HomeScreen();
        },
        transition: Transition.upToDown,
        transitionDuration: DurationItems.theme.str() * 2),
    GetPage(
        name: RoutesClass.splash,
        page: () {
          return const SplashScreen();
        },
        transition: Transition.fadeIn,
        transitionDuration: DurationItems.low.str()),
    GetPage(
        name: RoutesClass.setting,
        page: () {
          return const SettingScreen();
        },
        transition: Transition.fadeIn,
        transitionDuration: DurationItems.low.str()),
    GetPage(
        name: RoutesClass.notAdd,
        page: () {
          return const NoteAddScreen();
        },
        transition: Transition.fadeIn,
        transitionDuration: DurationItems.low.str()),
    // GetPage(
    //     name: RoutesClass.notUpdate,
    //     page: () {
    //       return const NoteUpdateScreen(not:,)
    //     },
    //     transition: Transition.fadeIn,
    //     transitionDuration: DurationItems.low.str()),
    // GetPage(
    //     name: RoutesClass.notDetails,
    //     page: () {
    //       return const NoteDetailsScreen(not: ,);
    //     },
    //     transition: Transition.fadeIn,
    //     transitionDuration: DurationItems.low.str()),
  ];
}
