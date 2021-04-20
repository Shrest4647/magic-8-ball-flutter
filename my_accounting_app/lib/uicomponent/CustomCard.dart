import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80.0,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        label,
        style: TextStyle(
          color: Color(0xFFFDFDF0),
        ),
      ),
    ]);
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({@required this.color, this.child});
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
