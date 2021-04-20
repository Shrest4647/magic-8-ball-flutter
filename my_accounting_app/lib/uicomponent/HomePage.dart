import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:my_accounting_app/uicomponent/DatePicker.dart';
import 'package:my_accounting_app/uicomponent/IncomeExpense.dart';
import 'package:my_accounting_app/WelcomeUser.dart';
import 'BalanceCard.dart';
import 'BottomModalSheet.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MyHomePage(
      title: 'Hello World',
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WelcomeUser(),
              BalanceCardList(),
              DatePicker(),
              IncomeExpense(),
            ],
          ),
        ),
        floatingActionButton: FabCircularMenu(
          children: <Widget>[
          IconButton(
              icon: Icon(Icons.account_balance, size: 40.0), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.favorite, size: 40.0),
              onPressed: () {
                print('Favorite');
              }),
          ModalBottomSheet(),
        ]));
  }
}

