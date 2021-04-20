import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: 'Cash In Hand\n', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Rs. 900', style: TextStyle(color: Colors.yellowAccent)),
                      ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(text: 'Total Expenses\n', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'Rs. 900', style: TextStyle(color: Colors.yellowAccent)),
                    ]
                  )),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text.rich(TextSpan(
                      children: [
                        TextSpan(text: 'Total Income\n', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Rs. 900', style: TextStyle(color: Colors.yellowAccent)),
                      ]
                  )),
                ),
              ),
            ),
          ],

        ),
      ],

    );
  }
}
