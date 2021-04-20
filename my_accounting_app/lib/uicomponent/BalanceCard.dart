import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BalanceCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: double.infinity,
    height: 200.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10.0), 

      children: [
        BalanceCard(title: "User 1", amount: 100, icon: Icons.calculate,),
        BalanceCard(title: "User", amount: 100, icon: Icons.calculate,),
        BalanceCard(title: "User", amount: 100, icon: Icons.calculate,),
      ],
    ),
      );
  }
}

class BalanceCard extends StatelessWidget {
  final String title;
  final int amount;
  final icon;
  BalanceCard({this.title, this.amount, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
            children: [
              Container(
                width: 300.0,
                height: 180.0,
                decoration: BoxDecoration(
                  // color: Colors.blue[400].withOpacity(0.6),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue[400].withOpacity(0.8), Colors.blue[800].withOpacity(0.5)],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.teal[100], width: 2.0)
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0,
                child: Container(
                width: 180.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90.0),
                    bottomRight: Radius.circular(90.0),
                    topRight: Radius.circular(10.0),
                    ),
                color: Colors.white.withOpacity(0.2),
                ),
              ),
               ),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                width: 100.0,
                height: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(90.0),
                  right: Radius.circular(10.0)),
                color: Colors.pink.withOpacity(0.3),
                ),
              ),
               ),
               Positioned(
                 top: 100.0,
                 left: 20.0,
                 child: SizedBox(
                 child: Text.rich(
                   TextSpan( 
                    children: [
                      TextSpan(
                        text:'Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16.0),
                          ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text:'Rs. $amount',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0),
                          ),
                      ]
                 ),
                 ),
                ),
                 ),
                Positioned(
                 top: 10.0,
                 left: 30.0,
                 child: SizedBox(
                 child: Text.rich(
                   TextSpan( 
                    children: [
                      TextSpan(
                        text:'$title',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 21.0),
                          ),                                            
                    ],
                  ),
                 ),
                ),
              ),
            ],
            ),
    );

  }
}