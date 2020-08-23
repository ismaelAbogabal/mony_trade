import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool byOnClick = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting"), centerTitle: true),
      body: SwitchListTile.adaptive(
        value: byOnClick,
        title: Text("Buy in one Click"),
        onChanged: (value) => setState(() => byOnClick = value),
      ),
    );
  }
}
