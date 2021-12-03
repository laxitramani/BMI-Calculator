import 'package:bmi_calculator/Components/BotomButton.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/Components/ReusableCard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiresult,
      @required this.resulttext,
      @required this.interpretation});

  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Results'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Results',
                  style: klargetitletext,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kinactivecardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resulttext,
                      style: kcustomtitletext,
                    ),
                    Text(
                      bmiresult,
                      style: klargebodytext,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kinfotext,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttontext: 'RE-CALCULATE',
              onpress: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
