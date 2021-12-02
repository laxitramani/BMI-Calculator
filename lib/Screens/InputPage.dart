import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/Components/IconContent.dart';
import 'package:bmi_calculator/Components/ReusableCard.dart';
import 'package:bmi_calculator/Constants.dart';
import 'ResultsPage.dart';
import 'package:bmi_calculator/Components/BotomButton.dart';
import 'package:bmi_calculator/Components/RoundIconButton.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

enum GenderCardColor { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderCardColor gender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: new ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = GenderCardColor.male;
                        });
                      },
                      colour: gender == GenderCardColor.male
                          ? kactivecardcolor
                          : kinactivecardcolor,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = GenderCardColor.female;
                        });
                      },
                      colour: gender == GenderCardColor.female
                          ? kactivecardcolor
                          : kinactivecardcolor,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: klabeltextstyle,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: knumberstyle,
                        ),
                        Text(
                          'cm',
                          style: klabeltextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFEB1555)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 220.0,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                colour: kinactivecardcolor,
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kinactivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: klabeltextstyle,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          weight.toString(),
                          style: knumberstyle,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kinactivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: klabeltextstyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          age.toString(),
                          style: knumberstyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            BottomButton(
              onpress: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiresult: calc.calculateBmi(),
                            resulttext: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )),
                );
              },
              buttontext: 'CALCULATE',
            )
          ],
        ));
  }
}
