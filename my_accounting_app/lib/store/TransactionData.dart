import 'package:flutter/material.dart' show ChangeNotifier;
import 'dart:async';
import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import '../transaction/Transaction.dart';

class TransactionDataStore extends ChangeNotifier {

  List<Map<String, dynamic>> _transactions = [];

  final Future<Database> database = openDatabase(
    join('./accounting.db'),
    onCreate: (db, version) {
      return db.execute("CREATE TABLE IF NOT EXISTS Transactions ("
          "id INTEGER PRIMARY KEY AUTO INCREMENT,"
          "name TEXT NOT NULL,"
          "particular TEXT NOT NULL,"
          "createdDate TEXT,"
          "updatedDate TEXT,"
          "amount REAL NOT NULL,"
          "accountId INTEGER FOREIGN KEY"
          ")");
    },
    version: 1,
  );

  Future<void> insertTransaction(Transactions transaction) async {
    final Database db = await database;
    await db.insert('transactions', transaction.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final Database db = await database;
    final List<Map<String, dynamic>> _transactions = await db.query('transactions');
    notifyListeners();
    return _transactions;
  }

  Future<void> updateTransaction(Transactions transaction) async {
    final db = await database;
    await db.update(
      'transactions',
      transaction.toMap(),
      where: "'id' = ?",
      whereArgs: [transaction.id],
    );
    notifyListeners();
  }

  Future<void> deleteTransaction(int id) async {
    final Database db = await database;
    await db.delete(
      'transactions',
      where: "'id'=?",
      whereArgs: [id],
    );
    notifyListeners();
  }
}
