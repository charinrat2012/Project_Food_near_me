import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'home_ui.dart'; 
import 'myshop_ui.dart'; 
import '../controllers/pagectrl.dart'; 
import '../controllers/scrollctrl.dart'; 
class Navbar extends StatefulWidget {
  const Navbar({super.key});
  @override
  State<Navbar> createState() => _NavbarState();
}
class _NavbarState extends State<Navbar> {
  late MainController _mainController;
  late ScrollpageController _scrollpageController;
  @override
  void initState() {
    super.initState();
    _mainController = Get.find<MainController>();
    _scrollpageController = Get.find<ScrollpageController>();
    _mainController.tabController.addListener(_onTabChanged);
  }
  @override
  void dispose() {
    _mainController.tabController.removeListener(_onTabChanged);
    super.dispose();
  }
  void _onTabChanged() {
    if (_mainController.tabController.previousIndex != _mainController.tabController.index) {
      _scrollpageController.resetScrollButtonState();
    }
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
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          gradient: LinearGradient(colors: [
            Colors.pink[200]!,
            Colors.blue[300]!,
          ])
        ),
        ),
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _mainController.goToHomeTab,
      //   // backgroundColor: Colors.purple[100],
        
        
        
      //   shape: const CircleBorder(),
      //   elevation: 0,
      //   child: const Icon(Icons.home, color: Colors.white, size: 35),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      stateManagement: false, 
    );
  }
}