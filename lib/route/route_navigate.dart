import 'package:companyme/route/route_name.dart';
import 'package:companyme/screens/navigation_page.dart';
import 'package:companyme/screens/login_page.dart';
import 'package:get/get.dart';

class RouteNavigation{
  static final List<GetPage> routes=[
    GetPage(name: RouteName.loginRoute, page: ()=>LoginPage()),
    GetPage(name: RouteName.homeRoute, page: ()=>NavigationPage())
  ];
// static Object? generateRoute(RouteSettings settings){
//   switch(settings.name){
//     case RouteName.loginRoute:return Get.to(LoginPage());
//     case RouteName.homeRoute:return Get.to(HomePage());
//     default:return Get.to(DefaultPage());
//   }
// }
}