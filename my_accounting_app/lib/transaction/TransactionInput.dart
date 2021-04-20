import 'package:flutter/material.dart';
import 'package:my_accounting_app/account/Account.dart';
import 'package:my_accounting_app/store/DataStore.dart';
import 'package:my_accounting_app/transaction/Transaction.dart';
import 'package:provider/provider.dart';

class TransactionInputForm extends StatefulWidget {
  @override
  _TransactionInputFormState createState() => _TransactionInputFormState();
}

class _TransactionInputFormState extends State<TransactionInputForm> {
  final Map<String, dynamic> transactionData = {
    'name': '',
    'particular': '',
    'amount': 0,
    'accountId': null
  };

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accounts =
        Provider.of<DataStore>(context, listen: true).accounts;
    Account dropDownValue = Provider.of<DataStore>(context, listen: true).currentAccount;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text('Transaction Entry',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.w600,
                              fontSize: 30.0))),
                ),
                Container(
                  child: DropdownButton<Account>(
                    value: dropDownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 30,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (newValue) {
                      print(newValue.toMap());
                      Provider.of<DataStore>(context).setCurrentAccount(newValue);
                    },
                    items: accounts.map((value) {
                      return DropdownMenuItem(
                        value: Account.fromMap(value),
                        child: Text(value['name']),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Transaction Name',
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Transaction Name is empty';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      this.transactionData['name'] = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Transaction Particular',
                    ),
                    textInputAction: TextInputAction.next,
                    onSaved: (value) {
                      this.transactionData['particular'] = value;
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 30.0, right: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Transactions transaction = Transactions(
                              name: transactionData['name'],
                              particular: transactionData['particular'],
                              amount: transactionData['amount'],
                              accountId: transactionData['accountId']);
                        }
                      },
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionForm extends StatefulWidget {
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Your Email"),
                  validator: (value) {
                    Pattern pattern =
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$";
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value) || value == null)
                      return 'Enter a valid email address';
                    else
                      return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ]),
        ));
  }
}
