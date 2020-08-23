import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    controller.forward(from: 0);
    //for mapping the list children
    int currentElement = 0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.2),
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(10000, 2000)),
          ),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.2),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(10000, 2000)),
            ),
            child: ScaleTransition(
              scale: CurvedAnimation(
                curve: Interval(
                  0.0,
                  1.0,
                  curve: Curves.elasticInOut,
                ),
                parent: controller,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 50),
                  ),
                  Text("User Name"),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Text("ID: 12354",
                        style: TextStyle(fontSize: 10, color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(context, "/profile"),
            leading: Icon(Icons.person_outline, color: Colors.green),
            title: Text("Profile"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, "/settings"),
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text("Settings"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, "/customerSupport"),
            leading: Icon(Icons.call, color: Colors.blueAccent),
            title: Text("Customer support"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, "/faqs"),
            leading: Icon(Icons.question_answer, color: Colors.orange),
            title: Text("FAQs"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(
            color: Colors.black12,
            thickness: 10,
            height: 10,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.redAccent,
            ),
            title: Text("Log Out"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
//          Divider(
//            height: 50,
//            color: Colors.black12,
//            thickness: 50,
//          ),
        ].map((e) {
          currentElement++;
          return SlideTransition(
            child: e,
            position: Tween<Offset>(
              begin: Offset(-1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(
                  min((currentElement - 1) * .2, .8),
                  min(currentElement * .2 + .2, 1),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
