import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onpress, @required this.buttontext});
  final Function onpress;
  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Center(
          child: Text(
            buttontext,
            style: klargebuttonstyle,
          ),
        ),
        color: kbottomcontainercolor,
        margin: EdgeInsets.only(top: 10.0),
        height: kbottomcontainerheight,
        width: double.infinity,
      ),
    );
  }
}
