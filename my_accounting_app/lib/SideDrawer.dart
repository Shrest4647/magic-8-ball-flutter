import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Text('Welcome to the drawer'),),
          ListTile(title: Text('List 1'),),
          ListTile(title: Text('List 2'),),
          ListTile(title: Text('List 3'),),
        ],
      ),
    );
  }
}
