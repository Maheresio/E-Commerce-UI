import 'core/global/themes/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'features/auth/views/profile_view.dart';
import 'features/home/view/home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomeView(),
      HomeView(),
      HomeView(),
      HomeView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        inactiveIcon: const Icon(Icons.home_outlined),
        title: "Home",
        activeColorPrimary: AppColorsLight.kPrimaryColor,
        inactiveColorPrimary: AppColorsLight.kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        inactiveIcon: const Icon(Icons.shopping_cart_outlined),
        title: "Shop",
        activeColorPrimary: AppColorsLight.kPrimaryColor,
        inactiveColorPrimary: AppColorsLight.kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag),
        inactiveIcon: const Icon(Icons.shopping_bag_outlined),
        title: "Bag",
        activeColorPrimary: AppColorsLight.kPrimaryColor,
        inactiveColorPrimary: AppColorsLight.kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        inactiveIcon: const Icon(Icons.favorite_border_outlined),
        title: "Favorites",
        activeColorPrimary: AppColorsLight.kPrimaryColor,
        inactiveColorPrimary: AppColorsLight.kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        inactiveIcon: const Icon(Icons.person_outlined),
        title: "Profile",
        activeColorPrimary: AppColorsLight.kPrimaryColor,
        inactiveColorPrimary: AppColorsLight.kGreyColor,
      ),
    ];
  }
}
