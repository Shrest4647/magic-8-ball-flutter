import 'package:flutter/material.dart';
import 'package:my_accounting_app/transaction/TransactionInput.dart';
import 'package:my_accounting_app/uicomponent/HomePage.dart';
import 'dart:core';

import 'account/AccountDetailPage.dart';
import 'account/AccountsListPage.dart';
import 'UnknownPage.dart';
import 'Counter.dart';
import 'account/NewAccountForm.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Handle '/'
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => HomeScreen()
          // Counter()
          // NewAccountForm()
          );
    }
    if (settings.name == '/transactionform') {
      return MaterialPageRoute(builder: (context) => TransactionInputForm());
    }

    // Handle '/accountform'
    if (settings.name == '/accountform') {
      return MaterialPageRoute(builder: (context) => NewAccountForm());
    }
    // Handle '/accounts'
    if (settings.name == '/accounts') {
      return MaterialPageRoute(builder: (context) => AccountsListPage());
    }
    // Handle '/transactions'
    if (settings.name == '/transactions') {
      return MaterialPageRoute(builder: (context) => AccountsListPage());
    }
    var uri = Uri.parse(settings.name);
    // Handle '/account/:id'
    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'account') {
      var id = int.parse(uri.pathSegments[1]);
      return MaterialPageRoute(builder: (context) => AccountDetailPage(id));
    }
    // Handle '/edit/account/id'
    if (uri.pathSegments.length == 3 &&
        uri.pathSegments.first == 'edit' &&
        uri.pathSegments[1] == 'account') {
      var id = int.parse(uri.pathSegments[1]);
      return MaterialPageRoute(builder: (context) => AccountDetailPage(id));
    }
    // Handle '/edit/transaction/id'
    if (uri.pathSegments.length == 3 &&
        uri.pathSegments.first == 'edit' &&
        uri.pathSegments[1] == 'transaction') {
      var id = int.parse(uri.pathSegments[1]);
      return MaterialPageRoute(builder: (context) => AccountDetailPage(id));
    }

    return MaterialPageRoute(builder: (context) => UnknownPage());
  }
}
