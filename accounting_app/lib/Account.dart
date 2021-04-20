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
 final int id;
 final String firstName;
 final String lastName;
 DateTime createdDate = DateTime.now();
 DateTime updatedDate = DateTime.now();
 final double monthlyBudget;

  Account({this.id, this.firstName, this.lastName, this.monthlyBudget});
  Account._({this.id, this.firstName, this.lastName, this.monthlyBudget, this.createdDate, this.updatedDate});
  factory Account.fromMap(Map<String, dynamic> json) => new Account._(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    monthlyBudget: json["monthlyBudget"],
    createdDate: json["createdDate"],
    updatedDate: json["updatedDate"],
  );

 Map < String, dynamic> toMap() => {
   'id': id,
   'firstName': firstName,
   'lastName': lastName,
   'createdDate': createdDate,
   'updatedDate': updatedDate,
   'monthlyBudget': monthlyBudget
 };

}