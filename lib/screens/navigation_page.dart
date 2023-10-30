import 'package:companyme/screens/default_page.dart';
import 'package:companyme/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import '../getx/bottom_nav_controller.dart';

class NavigationPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: MoltenBottomNavigationBar(
            domeCircleSize: 60,
            domeCircleColor: Colors.indigo[900],
            barColor: Colors.white,
            curve: Curves.bounceOut,
            onTabChange: landingPageController.changeTabIndex,
            selectedIndex: landingPageController.tabIndex.value,
            tabs: [
              MoltenTab(
                unselectedColor: Colors.black,
                icon: Column(
                  children: [
                    Icon(
                          Icons.home,
                          size: 30.0,
                    ),
                    Text('Home',style: TextStyle(color: Colors.indigo[900],fontSize: 8),)
                  ],
                ),
              ),
              MoltenTab(
                unselectedColor: Colors.black,
                icon: Column(
                  children: [
                    Icon(
                      Icons.bar_chart,
                      size: 30.0,
                    ),
                    Text('Audit',style: TextStyle(color: Colors.indigo[900],fontSize: 8),)
                  ],
                ),
              ),
              MoltenTab(
                unselectedColor: Colors.black,
                icon: Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 30.0,
                    ),
                    Text('Profile',style: TextStyle(color: Colors.indigo[900],fontSize: 8),)
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
             HomePage(),
              DefaultPage(),
              DefaultPage(),
            ],
          )),
    ));
  }
}
