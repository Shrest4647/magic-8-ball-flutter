import 'dart:core';
import 'dart:convert';

Account accountFromJson(String str) {
  final jsonData = json.decode(str);
  return Account.fromMap(jsonData);
}

String accountToJson(Account data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Account {
  int id;
  final String name;
  DateTime createdDate = DateTime.now();
  DateTime updatedDate = DateTime.now();
  final double monthlyBudget;

  Account({this.name, this.monthlyBudget});
  Account._(
      {this.id,
      this.name,
      this.monthlyBudget,
      this.createdDate,
      this.updatedDate});
  factory Account.fromMap(Map<String, dynamic> json) => new Account._(
        id: json["id"],
        name: json['name'],
        monthlyBudget: json["monthlyBudget"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        //  'id': id,
        'name': name,
        'createdDate': createdDate.toIso8601String(),
        'updatedDate': updatedDate.toIso8601String(),
        'monthlyBudget': monthlyBudget
      };
  bool operator ==(dynamic other) =>
      other != null &&
      other is Account &&
      this.id == other.id &&
      this.name == other.name &&
      this.monthlyBudget == other.monthlyBudget &&
      this.createdDate == other.createdDate &&
      this.updatedDate == other.updatedDate;

  @override
  int get hashCode => super.hashCode;
}
