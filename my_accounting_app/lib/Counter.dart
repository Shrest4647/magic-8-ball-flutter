
import 'package:flutter/material.dart';
import 'package:my_accounting_app/store/DataStore.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  final String title = '';
  Counter();
  void _incrementCounter(BuildContext context) {
  Provider.of<DataStore>(context, listen: false).incrementCounter();
}
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<DataStore>(context).getCounter;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => _incrementCounter(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}