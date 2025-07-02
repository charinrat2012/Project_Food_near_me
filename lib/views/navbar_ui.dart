import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../controllers/pagectrl.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late MainController _mainController;
  

  @override
  void initState() {
    super.initState();
    _mainController = Get.find<MainController>();
    
  }

  

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _mainController.tabController,
      tabs: _mainController.tabs,
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        height: 60,
        navBarDecoration: NavBarDecoration(
          color: Colors.pink[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          gradient: LinearGradient(colors: [
            Colors.pink[200]!,
            Colors.blue[300]!,
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      
      
      stateManagement: true,
    );
  }
}
