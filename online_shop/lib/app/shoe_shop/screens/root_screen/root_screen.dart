
import 'package:flutter/material.dart';
import 'package:online_shop/app/shoe_shop/screens/cart/cart_screen.dart';
import 'package:online_shop/app/shoe_shop/screens/root_screen/provider/cart_provider.dart';
import 'package:online_shop/app/shoe_shop/screens/screens.dart';
import 'package:online_shop/app/shoe_shop/screens/widget/src/cart_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  PersistentTabController? _controller;
  GlobalKey<CartScreenState> cartKey = GlobalKey<CartScreenState>();
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext? context) {
    return PersistentTabView(
      context!,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      onItemSelected: (i){
      },
      navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.


    );
   /*
    return PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
    curve: Curves.ease,
    ),
    screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
    animateTabTransition: true,
    curve: Curves.ease,
    duration: Duration(milliseconds: 200),
    ),
    onItemSelected: (i){
    },
    navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
    );

    */

  }
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(listKey: listKey,),
      CartScreen(key: cartKey, listKey: listKey,isFromNav: true,),
      ProfileScreen()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_rounded),
        title: ("Home"),
        activeColorPrimary: Color(0xff0035BA),
        inactiveColorPrimary: Color(0xff2E3A59)
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
          activeColorPrimary: Color(0xff0035BA),
          inactiveColorPrimary: Color(0xff2E3A59)
      ),
      PersistentBottomNavBarItem(
          icon: Consumer<CartProvider>(
              builder: (context, cartPrv, child){
                return  CartWidget(isNav: true,listKey: listKey,listCart: cartPrv.listCart,);
              },),
          title: ("Cart"),
          activeColorPrimary: Color(0xff0035BA),
          inactiveColorPrimary: Color(0xff2E3A59)
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: Color(0xff0035BA),
          inactiveColorPrimary: Color(0xff2E3A59)
      ),
    ];
  }
}
