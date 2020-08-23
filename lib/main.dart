import 'package:flutter/material.dart';
import 'package:mony_trade/screen/home_screen.dart';
import 'package:mony_trade/screen/login_screen.dart';
import 'package:mony_trade/screen/more_screens/customer_support.dart';
import 'package:mony_trade/screen/more_screens/faqs_screen.dart';
import 'package:mony_trade/screen/more_screens/profile_screen.dart';
import 'package:mony_trade/screen/more_screens/setting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Trade',
//      theme: ThemeData.dark().copyWith(
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//        scaffoldBackgroundColor: Colors.blueAccent.withOpacity(.28),
//        primaryColor: Colors.redAccent,
//        primaryColorDark: Colors.redAccent,
//        primaryColorLight: Colors.redAccent,
//        bottomNavigationBarTheme: BottomNavigationBarThemeData(
//          backgroundColor: Colors.black.withOpacity(.1),
//        ),
//      ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff051B31),
        primaryColor: Color(0xff051B31),
        primaryColorDark: Color(0xff051B31),
        primaryColorLight: Color(0xff051B31),
        appBarTheme: AppBarTheme(elevation: 0,centerTitle: true),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
          height: 40,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 6,
          backgroundColor: Color(0xff051B31),
        ),
      ),

      routes: {
        "/": (ctx) => LoginScreen(),
        "/home": (ctx) => HomeScreen(),
        "/profile": (ctx) => ProfileScreen(),
        "/settings": (ctx) => SettingsScreen(),
        "/customerSupport": (ctx) => CustomerSupport(),
        "/faqs": (ctx) => FAQsScreen(),
      },
    );
  }
}
