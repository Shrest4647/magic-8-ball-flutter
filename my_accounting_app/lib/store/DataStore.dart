import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:my_accounting_app/account/Account.dart';
import 'package:my_accounting_app/store/DatabaseHelper.dart';
import 'dart:core';
import 'package:flutter/widgets.dart';

class DataStore extends ChangeNotifier {
  final databaseHelper = DatabaseHelper.instance;
  
  int _count = 0;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
  
  List<Map<String, dynamic>> _accounts = [];
  Account _currentAccount;

  initAccounts() async {
      _accounts = await databaseHelper.getAccounts();
      _currentAccount = Account.fromMap(_accounts[0]);
  }

  List<Map<String, dynamic>> get accounts {
    if(_accounts.length==0) {
      initAccounts();
      notifyListeners();
    }
    return _accounts;
  }
  
  Account get currentAccount {
    return _currentAccount;
  }

  setCurrentAccount(Account newValue) {
    _currentAccount = newValue;
    notifyListeners();

  }


}
