import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customer Support"), centerTitle: true),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            color: Colors.white12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("E-mail"),
                  trailing: Text("example@gmail.com"),
                ),
                SizedBox(height: 20),
                Text("You will get a response within 1 business day"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            color: Colors.white12,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text("Chat"),
                  trailing: OutlineButton(
                    onPressed: () {},
                    borderSide: BorderSide(color: Colors.blueAccent),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("Online Support"),
                  ),
                ),
                SizedBox(height: 20),
                Text("Available from 9:00 to 19:00"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
