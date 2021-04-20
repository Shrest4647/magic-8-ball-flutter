
import 'package:flutter/material.dart';

class WelcomeUser extends StatefulWidget {
  @override
  _WelcomeUserState createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  String _greetings = 'Good Morning';
  String _user = 'Sunil Shrestha';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$_greetings'),
                Text('$_user', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, ),
                )
              ]
              
            ),
          ),
          Spacer(flex: 3,),
          Expanded(child: Center(child: Icon(Icons.notifications, color: Colors.amber, size: 30.0,)),
          ),
          Expanded(child: ClipOval( 
            child: Image.asset('images/laptop-user.png', height: 50.0, width: 70.0,),
            ),
          )
        ],
        ),
      
    );
  }
}