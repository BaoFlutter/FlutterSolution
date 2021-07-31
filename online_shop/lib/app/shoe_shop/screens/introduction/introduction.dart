
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:online_shop/app/app.dart';
import 'package:online_shop/data_source/assets_link/assets_links.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ShoeShopIntroduction extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: _mainBody(context),
    );
  }

  _mainBody(BuildContext context) {
    PageDecoration pageDecoration =  PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero, );
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Find many products",
          body:
          "You can find many products whenever you want",
          image: Center(child: Image.asset(ImageLinks().intro1),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fast delivery",
          body:
          "Purchasing will be easy with our professional delivery team",
          image: Center(child: Image.asset(ImageLinks().intro2),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Secure payment",
          body:
          "Fast, safe and secure",
          image:Center(child: Image.asset(ImageLinks().intro3),),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        pushNewScreen(context,
        screen: ShoeLoginScreen(),
        withNavBar: false);
      },
      onSkip: () => pushNewScreen(context,
          screen: ShoeLoginScreen(),
          withNavBar: false), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
