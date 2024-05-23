import 'dart:math';

import 'package:bmi_calculater_app/Age_Weight_Widget.dart';
import 'package:bmi_calculater_app/HeightWidget.dart';
import 'package:bmi_calculater_app/ScorePage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'GenderWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int gender = 0;
  int height = 150;
  int age = 30;
  int weight = 50;
  bool isFinished = false;
  double bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculater'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(),
            child: Column(
              children: [
                
                GenderWidget(onChange: (genderVal ) {
                  gender = genderVal;
                },),
                HeightWidget(onChange: (heightVal){
                  height = heightVal;
                }),


                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeightWidget(
                        onChange: (ageVal){
                          age = ageVal;
                        },
                        title: 'Age',
                        intValue: 30,
                        max: 0,
                        min: 100
                    ),
                    AgeWeightWidget(
                        onChange: (wegihtVal){
                          weight = wegihtVal;
                        },
                        title: 'Weight (Kg)',
                        intValue: 50,
                        max: 0,
                        min: 200
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                  child: SwipeableButtonView(
                      isFinished: isFinished,
                      onFinish: ()async{
                        await Navigator.push(context,PageTransition(
                            child: ScorePage(
                                bmiScore: bmiScore,
                                age: age),
                            type: PageTransitionType.fade)
                        );
                        setState(() {
                          isFinished = false;
                        });
                      },
                      onWaitingProcess: (){
                        calculateBmi();
                        Future.delayed(const Duration(seconds:1),(){
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      activeColor: Colors.blue,
                      buttonWidget: const Icon(Icons.arrow_forward_ios_rounded),
                      buttonText: 'Calculate'
                  ),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi(){
    bmiScore = weight/pow(height/100, 2);
  }

}
