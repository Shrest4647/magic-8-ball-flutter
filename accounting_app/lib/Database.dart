import 'dart:async';
import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:accountingapp/Account.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

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
      await db.execute("CREATE TABLE IF NOT EXISTS Account ("
          "id INTEGER PRIMARY KEY,"
          "firstName TEXT,"
          "lastName TEXT,"
          "createdDate TEXT,"
          "updatedDate TEXT,"
          "monthlyBudget REAL"
          ")");
    });
  }

  newAccount(Account account) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Account");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.insert('Account', account.toMap());
//    rawInsert(
//        "INSERT Into Account (id,firstName,lastName,monthlyBudget,createdDate,updatedDate)"
//            " VALUES (?,?,?,?,datetime('now', 'localtime'),datetime('now', 'localtime'))",
//        [id, account.firstName, account.lastName, account.monthlyBudget]);
    return raw;
  }

  updateAccount(Account account) async {
    final db = await database;
    var res = await db.update("Account", account.toMap(),
        where: "id = ?", whereArgs: [account.id]);
    return res;
  }

  getAccount(int id) async {
    final db = await database;
    var res = await db.query("Account", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Account.fromMap(res.first) : null;
  }

  Future<List<Account>> getAccounts() async {
    final db = await database;
    var res = await db.query("Account");
    List<Account> list =
    res.isNotEmpty ? res.map((a) => Account.fromMap(a)).toList() : [];
    return list;
  }

  deleteAccount(int id) async {
    final db = await database;
    return db.delete("Account", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Account");
  }
}