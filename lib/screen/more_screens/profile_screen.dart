import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        physics: BouncingScrollPhysics(),
        children: [
          Text("Profile Picture"),
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, color: Colors.white, size: 40),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Nickname"),
            subtitle: Text("name"),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.call_merge),
            title: Text("Gender"),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
