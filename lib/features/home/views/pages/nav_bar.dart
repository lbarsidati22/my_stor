// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';
import 'package:my_stor/features/cart/views/pages/cart_page.dart';
import 'package:my_stor/features/favorite/views/pages/favorite_page.dart';
import 'package:my_stor/features/home/views/pages/home_page.dart';
import 'package:my_stor/features/profile/views/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late final PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.blueGrey,
        activeColorPrimary: Theme.of(context).primaryColor,
        icon: Icon(
          CupertinoIcons.home,
        ),
        title: 'Home',
      ),
      // PersistentBottomNavBarItem(
      //   inactiveColorPrimary: Colors.blueGrey,
      //   activeColorPrimary: Theme.of(context).primaryColor,
      //   icon: Icon(
      //     Icons.category_sharp,
      //   ),
      //   title: 'Category',
      // ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.blueGrey,
        activeColorPrimary: Theme.of(context).primaryColor,
        icon: Icon(
          CupertinoIcons.shopping_cart,
        ),
        title: 'Order',
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.blueGrey,
        activeColorPrimary: Theme.of(context).primaryColor,
        icon: Icon(
          CupertinoIcons.heart,
        ),
        title: 'Favorite',
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.blueGrey,
        activeColorPrimary: Theme.of(context).primaryColor,
        icon: Icon(
          CupertinoIcons.person,
        ),
        title: 'Person',
      )
    ];
  }

  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    // CategoryPage(),
    CartPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: currentIndex != 0 ? true : false,
        // leading: Padding(
        //   padding: const EdgeInsets.all(4.0),
        //   child: CircleAvatar(
        //     radius: 25,
        //     backgroundImage: AssetImage('assets/images/lbar.jpg'),
        //   ),
        // ),
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 55,
          color: AppColors.primaryColor,
        ),
        // actions: [
        //   if (currentIndex == 0) ...[
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.search),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.notifications),
        //     ),
        //   ] else if (currentIndex == 1)
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.shopping_bag),
        //     )
        // ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: screens,
        items: navBarItems(),
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: false,
        hideNavigationBarWhenKeyboardAppears: true,
        padding: const EdgeInsets.only(top: 7, bottom: 5),
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
