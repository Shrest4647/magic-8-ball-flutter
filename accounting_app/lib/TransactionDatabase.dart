import 'dart:async';
import 'dart:core';
import 'package:accountingapp/Transaction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:accountingapp/Account.dart';
import 'package:path/path.dart';

class TransactionProvider {
  TransactionProvider._();
  static final TransactionProvider db = TransactionProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, "accounting.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE IF NOT EXISTS Transactions ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT NOT NULL,"
          "particular TEXT NOT NULL,"
          "createdDate TEXT,"
          "updatedDate TEXT,"
          "amount REAL NOT NULL,"
          "accountId INTEGER FOREIGN KEY"
          ")");
    });
  }

  newTransaction(Transactions transaction) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Transactions");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.insert('Transactions', transaction.toMap());
//    rawInsert(
//        "INSERT Into Account (id,firstName,lastName,monthlyBudget,createdDate,updatedDate)"
//            " VALUES (?,?,?,?,datetime('now', 'localtime'),datetime('now', 'localtime'))",
//        [id, account.firstName, account.lastName, account.monthlyBudget]);
    return raw;
  }

  updateTransaction(Transactions transaction) async {
    final db = await database;
    var res = await db.update("Transactions", transaction.toMap(),
        where: "id = ?", whereArgs: [transaction.id]);
    return res;
  }

  getTransaction(int id) async {
    final db = await database;
    var res = await db.query("Transactions", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Transactions.fromMap(res.first) : null;
  }

  Future<List<Transactions>> getTransactions({int accountId = -1}) async {
    final db = await database;
    var res = accountId < 0? 
    await db.query("Transactions") :
    await db.query("Transactions", where: "accountId = ?", whereArgs: [accountId]);
    List<Transactions> list =
    res.isNotEmpty ? res.map((a) => Transactions.fromMap(a)).toList() : [];
    return list;
  }

  deleteTransaction(int id) async {
    final db = await database;
    return db.delete("Transactions", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Transactions");
  }
  
  Future<Map<String, dynamic>> getDueAmount({int accountId = -1}) async {
    final db = await database;
    var res = accountId < 0 ?
        await db.rawQuery("Select -1 as accountId, count(accountId) as count, SUM(net_amount) as net from "
            "(SELECT accountId, SUM(amount) as net_amount from Transactions group by accountId)"
            "where net_amount> 0 ") :
        await db.rawQuery("Select accountId, 1 as count, net_amount as net from "
        "(SELECT accountId, SUM(amount) as net_amount from Transactions group by accountId)"
        "where accountId = ?", [accountId]);
    List<Map<String, dynamic>> value = res.isEmpty? 0: res;
    return value.first;
  }
  Future<double> getNetAmountByAccount({int accountId = -1}) async {
    final db = await database;
    var res = accountId < 0 ?
        await db.rawQuery("Select SUM(amount) as net from Transactions") :
        await db.rawQuery("Select SUM(amount) as net from Transactions where accountId = ?", [accountId]);
    List<Map<String, double>> value = res.isEmpty? null: res;
    return value.first['net'];
  }

  Future<Map<String, dynamic>> getOutstandingAmount({int accountId = -1}) async {
    final db = await database;
    var res = accountId < 0 ?
    await db.rawQuery("Select -1 as accountId, count(accountId) as count, SUM(net_amount) as net from "
        "(SELECT accountId, SUM(amount) as net_amount from Transactions group by accountId)"
        "where amount< 0 ") :
    await db.rawQuery("Select accountId, 1 account, net_amount as net from "
        "(SELECT accountId, SUM(amount) as net_amount from Transactions group by accountId)"
        "where accountId = ?", [accountId]);
    List<Map<String, dynamic>> value = res.isEmpty? 0: res;
    return value.first;
  }
}