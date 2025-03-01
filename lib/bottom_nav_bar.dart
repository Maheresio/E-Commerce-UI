import 'features/cart/view/cart_view.dart';

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
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CartView(),
      const SizedBox(),
      const SizedBox(),
      const ProfileView(),
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
