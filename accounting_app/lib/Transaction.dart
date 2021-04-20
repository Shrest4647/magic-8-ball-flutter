import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';

Transactions transactionsFromJson(String str) {
  final jsonData = json.decode(str);
  return Transactions.fromMap(jsonData);
}

String transactionsToJson(Transactions data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Transactions {
  int id;
  String name;
  String particular;
  double amount;
  DateTime createdDate = DateTime.now();
  DateTime updatedDate = DateTime.now();
  int accountId;

  Transactions(
      {this.id, this.name, this.particular, this.amount, this.accountId});
  Transactions._(
      {this.id,
      this.name,
      this.particular,
      this.amount,
      this.accountId,
      this.updatedDate,
      this.createdDate});

  factory Transactions.fromMap(Map<String, dynamic> json) => new Transactions._(
        id: json["id"],
        name: json["name"],
        particular: json["particular"],
        amount: json["amount"],
        accountId: json["accountId"],
        createdDate: json["createdDate"],
        updatedDate: json["updatedDate"],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'particular': particular,
        'createdDate': createdDate,
        'updatedDate': updatedDate,
        'amount': amount,
        'accountId': accountId
      };

}
