import 'package:flutter/material.dart';
import 'main.dart';
import 'NewCard.dart';

class Results extends StatelessWidget {

  Results({required this.BMI,required this.result,required this.inter});

  late String result;
  late String BMI;
  late String inter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Center(
                child: Container(
                  child: Text("Your Result",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
          ),
          Expanded(
            flex: 6,
            child: NewCard(
              colour: Color(0xFF1A1F35),
              childcard:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(result,
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(BMI,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 100,
                  ),),
                  Text(inter,
                  style: TextStyle(
                    fontSize: 30
                  ),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: BottomBarColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: BottomBarHeight,
              child: Center(
                child: Text("RECALCULATE BMI",
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
