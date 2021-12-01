import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'ReusableCard.dart';

const bottomcontainerheight = 80.0;
const activecardcolor = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);
const bottomcontainercolor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = inactivecardcolor;
  Color femalecardcolor = inactivecardcolor;

  void updatecolor(int gender) {
    if (gender == 1) {
      if (malecardcolor == inactivecardcolor) {
        malecardcolor = activecardcolor;
        femalecardcolor = inactivecardcolor;
      } else {
        malecardcolor = inactivecardcolor;
      }
    }
    if (gender == 2) {
      if (femalecardcolor == inactivecardcolor) {
        femalecardcolor = activecardcolor;
        malecardcolor = inactivecardcolor;
      } else {
        femalecardcolor = inactivecardcolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolor(1);
                        });
                      },
                      child: new ReusableCard(
                        colour: malecardcolor,
                        cardchild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolor(2);
                        });
                      },
                      child: ReusableCard(
                        colour: femalecardcolor,
                        cardchild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(colour: inactivecardcolor),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: inactivecardcolor),
                ),
                Expanded(
                  child: ReusableCard(colour: inactivecardcolor),
                ),
              ],
            )),
            Container(
              color: bottomcontainercolor,
              margin: EdgeInsets.only(top: 10.0),
              height: bottomcontainerheight,
              width: double.infinity,
            )
          ],
        ));
  }
}
