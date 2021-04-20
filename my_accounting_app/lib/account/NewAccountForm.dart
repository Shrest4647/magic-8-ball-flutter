import 'package:flutter/material.dart';
import 'package:my_accounting_app/account/Account.dart';
import 'package:my_accounting_app/store/DatabaseHelper.dart';

class NewAccountForm extends StatefulWidget {
  @override
  _NewAccountFormState createState() => _NewAccountFormState();
}

class _NewAccountFormState extends State<NewAccountForm> {
  final databaseHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'name': '', 'monthlyBudget': 0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 400.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    Expanded(
                      child: Text(
                        "New Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "Arial"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 20.0,
                        child: TextFormField(
                          decoration:
                              InputDecoration(hintText: "Enter Account Name"),
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Account name is empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            formData['name'] = value;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 20.0,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          // initialValue: '0
                          decoration:
                              InputDecoration(hintText: "Enter Monthly Budget"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Monthly budget is empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            formData['monthlyBudget'] = double.parse(value);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Account account = Account(
                                name: formData['name'],
                                monthlyBudget: formData['monthlyBudget']);
                            this.databaseHelper.insertAccount(account).then(
                                (v) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "${formData['name']} Saved Successfully"),
                                ),
                              );
                              _formKey.currentState.reset();
                            }, onError: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Failed to save ${formData['name']}"),
                                ),
                              );
                            });
                          }
                        },
                      ),
                    ),
                    ElevatedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
