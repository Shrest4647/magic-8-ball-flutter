
import 'package:flutter/material.dart';

class IncomeExpense extends StatefulWidget {
  @override
  _IncomeExpenseState createState() => _IncomeExpenseState();
}

class _IncomeExpenseState extends State<IncomeExpense> {
  double income = 0;
  double expense = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.tealAccent[100].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(Icons.arrow_upward_rounded), 
              ),
              ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Spending\n'),
                        TextSpan(text: '$expense', style: TextStyle(
                          fontSize: 20.0 ),
                          ),
                      ]
                      ),
                      ),
                
              ]
            ),
            ),
          Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.tealAccent[100].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(Icons.arrow_downward_rounded), 
              ),
              ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Income\n'),
                        TextSpan(text: '$expense', style: TextStyle(
                          fontSize: 20.0 ),
                          ),
                      ]
                      ),
                      ),
                
              ]
            ),)
            
          ],
        ),
        
      ),
    );
  }
}