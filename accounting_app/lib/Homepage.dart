import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MY ACCOUNTING APP'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(
                    color: Color(0xFF191E33),
                    child: new CardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                  CustomCard(
                    color: Color(0xFF191E33),
                    child: CardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ],
              ),
            ),
            CustomCard(
              color: Color(0xFF191E33),
              child: Container(),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(color: Color(0xFF191E33)),
                  CustomCard(color: Color(0xFF191E33)),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80.0,
              margin: EdgeInsets.only(top: 15.0),
              decoration: BoxDecoration(
                color: Color(0xFFFF0010),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Theme(
          data: ThemeData(accentColor: Colors.purple),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {
              print("button pressed")
            },
          ),
        ),
      ),
    );
  }
}
