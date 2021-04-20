import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'Account.dart';

class DataStore extends ChangeNotifier {
  List<Map<String, dynamic>> _accounts = [];
  final Future<Database> database = openDatabase(
    join('./accounting.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE IF NOT EXIST account(id INTEGER PRIMARY KEY, name TEXT, createdDate TEXT, updatedDate TEXT, monthlyBudget REAL)",
      );
    },
    version: 1,
  );

  Future<void> insertAccount(Account account) async {
    final Database db = await database;
    await db.insert('account', account.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getAccounts() async {
    final Database db = await database;
    final List<Map<String, dynamic>> _accounts = await db.query('account');
    notifyListeners();
    return this._accounts;
  }

  Future<void> updateAccount(Account account) async {
    final db = await database;
    await db.update(
      'account',
      account.toMap(),
      where: "'id' = ?",
      whereArgs: [account.id],
    );
    notifyListeners();
  }

  Future<void> deleteAccount(int id) async {
    final Database db = await database;
    await db.delete(
      'account',
      where: "'id'=?",
      whereArgs: [id],
    );
    notifyListeners();
  }
}
