import 'dart:io';

import 'package:my_accounting_app/account/Account.dart';
import 'package:my_accounting_app/transaction/Transaction.dart';
import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  String _databaseName = 'my_accounting.db';
  int _databaseVersion = 1;

 // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase('./$_databaseName',
        version: _databaseVersion,
        onCreate: (db, version) async {
      Batch batch = db.batch();
      batch.execute("CREATE TABLE IF NOT EXISTS account(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, createdDate TEXT, updatedDate TEXT, monthlyBudget REAL)",);
      batch.execute("CREATE TABLE IF NOT EXISTS Transactions ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT NOT NULL,"
          "particular TEXT NOT NULL,"
          "createdDate TEXT,"
          "updatedDate TEXT,"
          "amount REAL NOT NULL,"
          "accountId INTEGER FOREIGN KEY"
          ")",);
      await batch.commit(noResult: true);
    },
    );
  }

  // Account Related function
  Future<void> insertAccount(Account account) async {
    final Database db = await database;
    print(account.toMap());
    await db.insert('account', account.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAccounts() async {
    final Database db = await database;
    // print("inside query");
    final List<Map<String, dynamic>> _accounts = await db.query('account');
    // print(_accounts);
    return _accounts;
  }

  Future<void> updateAccount(Account account) async {
    final db = await database;
    await db.update(
      'account',
      account.toMap(),
      where: "'id' = ?",
      whereArgs: [account.id],
    );
  }

  Future<void> deleteAccount(int id) async {
    final Database db = await database;
    await db.delete(
      'account',
      where: "'id'=?",
      whereArgs: [id],
    );
  }

  // Transaction related functions
  Future<void> insertTransaction(Transactions transaction) async {
    final Database db = await database;
    await db.insert('transactions', transaction.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getTransactions() async {
    final Database db = await database;
    final List<Map<String, dynamic>> _transactions = await db.query('transactions');
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
  }

  Future<void> deleteTransaction(int id) async {
    final Database db = await database;
    await db.delete(
      'transactions',
      where: "'id'=?",
      whereArgs: [id],
    );
  }

}