import 'package:flutter/material.dart';
import 'package:my_accounting_app/store/DataStore.dart';
import 'package:my_accounting_app/Router.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataStore()),
        // ChangeNotifierProvider.value(value: TransactionDataStore())
      ],
      child: MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF000000),
        scaffoldBackgroundColor: Color(0xFF0A0E0E)
      ),
     onGenerateRoute: MyRouter.generateRoute,
    );
  }
}

