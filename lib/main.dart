import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'NewCard.dart';
import 'ChildCards.dart';
import 'Result.dart';
import 'BMIbrain.dart';

const CardColor = Color(0xFF1A1F35);
const inactiveCardColor = Color(0xFF111328);
const BottomBarColor = Color(0xFF2196F3);
const BottomBarHeight = 80.0;
const texts=TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900);
const styletext=TextStyle(
  fontSize: 18,color: Color(0xFF8D8E98),
);

enum gender{male,female,}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(color: Color(0xFF070916),)
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color malecolor=CardColor;
  Color femalecolor=inactiveCardColor;
  int height=180;
  int weight=70;
  int age=19;

  void updategender(gender g)
  {
    malecolor=g==gender.male?CardColor:inactiveCardColor;
    femalecolor=g==gender.female?CardColor:inactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updategender(gender.male);
                      });
                    },
                    child: NewCard(
                      colour: malecolor,
                      childcard: ChildCards(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updategender(gender.female);
                      });
                    },
                    child: NewCard(colour: femalecolor, childcard: ChildCards(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewCard(colour: CardColor,
                childcard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT", style: styletext,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: texts),
                        Text("cm", style: styletext),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newvalue){
                          setState(() {
                            height=newvalue.round();
                          });
                        }
                        )
                  ],
                )
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: NewCard(
                      colour: CardColor,
                      childcard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT", style: styletext,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString(), style: texts),
                              Text("kg", style: styletext),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                todo: (){
                                  setState(() {
                                    weight--;
                                  },);},
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  todo: (){
                                    setState(() {
                                    weight++;
                                  },);},
                              )
                            ],
                          )
                        ],
                      )
                  ),
                ),
                Expanded(
                  child: NewCard(
                      colour: CardColor,
                      childcard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE", style: styletext,),
                        Text(age.toString(), style: texts),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              todo: (){
                                setState(() {
                                  age--;
                                },);},
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              todo: (){
                                setState(() {
                                  age++;
                                },);},
                            )
                          ],
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              BMICal calc = BMICal(height: height, wieght: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Results(BMI: calc.CalculateBMI(), result: calc.getResult(), inter: calc.getInter())));
            },
            child: Container(
              color: BottomBarColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: BottomBarHeight,
              child: Center(
                child: Text("CALCULATE BMI",
                  style:TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ) ,),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {

  RoundButton({required this.icon,required this.todo});

  IconData icon;
  Function todo;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){
        todo();
        },
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}