import '../303/navigator/navigate_home_details_view.dart';
import '../303/navigator/navigate_home_view.dart';
import '../303/navigator/navigate_profile_view.dart';

class RouteNavigator {
  final item = {
    RouteNavigatorEnum.home.str(): (context) => const NavigateHome(),
    RouteNavigatorEnum.homeDetails.str(): (context) =>
        const NavigateHomeDetails(),
    RouteNavigatorEnum.profile.str(): (context) => const NavigateProfile(),
  };
}

enum RouteNavigatorEnum { home, homeDetails, profile }

extension RouteStr on RouteNavigatorEnum {
  String str() {
    switch (this) {
      case RouteNavigatorEnum.home:
        return "/";
      case RouteNavigatorEnum.homeDetails:
        return "/home_details";
      case RouteNavigatorEnum.profile:
        return "/profile";
      default:
        return "/";
    }
  }
}
