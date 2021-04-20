import 'package:flutter/material.dart';
import 'dart:core';

import 'AccountDetailPage.dart';
import 'Homepage.dart';
import 'AccountsListPage.dart';
import 'UnknownPage.dart';

class Router {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Handle '/'
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => HomePage());
    }
    // Handle '/accounts'
    if(settings.name == '/accounts') {
      return MaterialPageRoute(builder: (context) => AccountsListPage());
    }
    // Handle '/transactions'
    if(settings.name == '/transactions') {
      return MaterialPageRoute(builder: (context) => AccountsListPage());
    }
    var uri = Uri.parse(settings.name);
    // Handle '/account/:id'
    if (uri.pathSegments.length == 2 &&
        uri.pathSegments.first == 'account') {
      var id = int.parse(uri.pathSegments[1]);
      return MaterialPageRoute(builder: (context) => AccountDetailPage(id));
    }
    // Handle '/edit/account/id'
    if (uri.pathSegments.length == 3 &&
        uri.pathSegments.first == 'edit' && uri.pathSegments[1] == 'account') {
      var id = int.parse(uri.pathSegments[1]);
      return MaterialPageRoute(builder: (context) => AccountDetailPage(id));
    }
    // Handle '/edit/transaction/id'
    if (uri.pathSegments.length == 3 &&
        uri.pathSegments.first == 'edit' && uri.pathSegments[1] == 'transaction') {
      var id = int.parse(uri.pathSegments[1]);
      return MaterialPageRoute(builder: (context) => AccountDetailPage(id));
    }

    return MaterialPageRoute(builder: (context) => UnknownPage());
  }
}