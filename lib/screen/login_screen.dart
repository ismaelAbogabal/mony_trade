import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mony_trade/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  googleLogin() {
    Navigator.pushReplacementNamed(context, "/home");
  }

  facebookLogin() {
    Navigator.pushReplacementNamed(context, "/home");
  }

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);
    return Scaffold(
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage("assets/background.jpg"),
//            fit: BoxFit.cover,
//          ),nImage(
////            image: AssetImage("assets/background.jpg"),
////            fit: BoxFit.cover,
////          ),
//            ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(0.0, (1 - controller.value) * 200.0)
                    ..scale(max(controller.value, .5)),
                  child: Opacity(
                    opacity: controller.value,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.scaleDown,
                      height: 150,
//                    width: 150,
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: Tween(begin: Offset(.9, 0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                        parent: controller, curve: Curves.elasticInOut)),
                child:
                    FittedBox(child: Text("Indian Best Trading Application")),
              ),
              ScaleTransition(
                scale: CurvedAnimation(
                    parent: controller, curve: Curves.elasticOut),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Easy to use \n\n",
                              style: kTitleTextStyle,
                            ),
                            TextSpan(
                                text: "More assets and fast payment service"),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Real Account \n\n",
                              style: kTitleTextStyle,
                            ),
                            TextSpan(text: "Easy to get started"),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Practice Account \n\n",
                              style: kTitleTextStyle,
                            ),
                            TextSpan(
                              text:
                                  "Learn on 1000 INR Account before invest in real Account ",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SlideTransition(
                    position: Tween(
                      begin: Offset(-1, 0),
                      end: Offset(0, 0),
                    ).animate(
                      CurvedAnimation(
                          curve: Interval(0.0, .5), parent: controller),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: RaisedButton.icon(
                        onPressed: facebookLogin,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        icon: Image.asset(
                          "assets/fblogo.png",
                          height: 40,
                          width: 40,
                        ),
                        label: Text("Log in with Facebook"),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SlideTransition(
                    position: Tween(
                      begin: Offset(-1, 0),
                      end: Offset(0, 0),
                    ).animate(
                      CurvedAnimation(
                          curve: Interval(0.3, .8), parent: controller),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: RaisedButton.icon(
                        onPressed: googleLogin,
                        colorBrightness: Brightness.light,
                        color: Colors.white,
                        icon: Image.asset(
                          "assets/glogo.png",
                          height: 40,
                          width: 40,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: Text("Log in with Google"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SlideTransition(
                    position: Tween(
                      begin: Offset(0, 2),
                      end: Offset(0, 0),
                    ).animate(
                      CurvedAnimation(
                        curve: Interval(0.5, 1.0),
                        parent: controller,
                      ),
                    ),
                    child: Text(
                      "By clicking continue you agree to \n privacy police and Terms and Conditions ",
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
