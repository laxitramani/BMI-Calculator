import 'package:flutter/material.dart';

const labeltextstyle = TextStyle(
  fontSize: 25.0,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 120.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: labeltextstyle,
        )
      ],
    );
  }
}
