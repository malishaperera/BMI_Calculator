import 'package:flutter/material.dart';
import 'constants.dart';



class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});
  

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  bool isMale = true;
  double height = 183;
  int weight = 74;
  int age = 30;
  double bmi = 0;

  double calculateBMI({required int weight,required double height}) {
    return weight / ((height / 100) * (height / 100));
  }

  Color getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue; // Underweight
    } else if (bmi < 25) {
      return Colors.green; // Normal weight
    } else if (bmi < 30) {
      return Colors.orange; // Overweight
    } else {
      return Colors.red; // Obesity
    }

  }
   static const Color kBackgroundColor = Color(0xFF0A0E21);
  @override
  Widget build(BuildContext context) {

    var borderRadius = BorderRadius.circular(5);
    var boxDecoration = BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)
                        );
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body:SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(                  
                        child: GestureDetector(
                          onTap:(){
                            setState(() {
                              isMale = true;
                            });
                            var bmiValue = calculateBMI(weight:weight, height:height);
                              setState(() {
                                bmi = bmiValue;
                              });
                          },
                          child: Container(                                             
                            padding: const EdgeInsets.all(20),
                            decoration:isMale 
                            ? kSelectedTileBorderDecoration : kTileBorderDecoration,              
                            child: const Column(
                              children: [
                                Icon(Icons.male,
                                size: 50,
                                color: kActiveTextColor,
                               ),
                                Text("Male",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: kActiveTextColor,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Expanded(                     
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = false;
                            });
                            var bmiValue = calculateBMI(weight:weight, height:height);
                              setState(() {
                                bmi = bmiValue;
                              });
                          },
                          child: Container(
                            decoration:!isMale 
                            ? kSelectedTileBorderDecoration : kTileBorderDecoration,       
                            padding: const EdgeInsets.all(20),
                            child: const Column(
                              children: [
                                Icon(Icons.female,
                                size: 50,
                                color: kActiveTextColor,
                               ),
                                Text("Female",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),                                 
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: kTileBorderDecoration,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text("Height",
                        style: TextStyle(
                          color: kActiveTextColor),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text(
                            height.toStringAsFixed(1),
                          style: const TextStyle(
                            color: kActiveTextColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                           )),
                          const Text("cm",
                          style: TextStyle(color: kActiveTextColor), ),
                        ],),
                                  
                        Slider(
                          min: 80,
                          max: 200,
                          value: height ,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                            var bmiValue = calculateBMI(weight:weight, height:height);
                              setState(() {
                                bmi = bmiValue;
                              });
                          },
                          thumbColor: kButtonColor,
                          activeColor: Colors.white,
                          // activeColor: Colors.lightBlue, 
                          // inactiveColor: Colors.grey[300], 
                          )
                      ],      
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: kTileBorderDecoration,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Text("Weight",
                              style: TextStyle(color: kActiveTextColor),),
                              Text("$weight",
                              style:const TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: kActiveTextColor),),
                              // Text("kg",style: TextStyle(color: kActiveTextColor),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: kBackgroundColor,
                                   
                                    shape: ShapeBorder.lerp(
                                      const CircleBorder(), 
                                      const CircleBorder(),
                                      0.5
                                     ),
                                    onPressed: (){
                                      
                                        if( weight > 25) {weight--;}                                     
                                     
                                      var bmiValue = calculateBMI(weight:weight, height:height);
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                                    } ,
                                    child: Icon(Icons.remove,color: kScaleButtonColor),
                                  ),
                                  const SizedBox(width: 10,),
                                  FloatingActionButton(
                                    backgroundColor: kBackgroundColor,
                                    elevation: 0,
                                    shape: ShapeBorder.lerp(
                                      CircleBorder(), 
                                      CircleBorder(),
                                      0.5
                                     ),
                                    onPressed: (){
                                      
                                          if( weight < 250) {weight++;}    
                                   
                                      var bmiValue = calculateBMI(weight:weight, height:height);
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                                    } ,
                                    child: Icon(Icons.add,color: kScaleButtonColor),
                                  ),
                                ],
                              )
                            ],),
                        ),
                      ),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Container(
                            decoration: kTileBorderDecoration,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                            children: [
                              Text("Age",style: TextStyle(color: kActiveTextColor),),
                              Text("$age",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: kActiveTextColor),),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: kBackgroundColor,
                                    elevation: 0,
                                    // materialTapTargetSize: 500px,
                                    shape: ShapeBorder.lerp(
                                      const CircleBorder(), 
                                      const CircleBorder(),
                                      0.5
                                     ),
                                    onPressed: (){
                                      
                                        if( age > 10) {age--;}                                     
                                   
                      
                                      var bmiValue = calculateBMI(weight:weight, height:height);
                                      setState(() {
                                        bmi = bmiValue;
                                      });
                                    } ,
                                   
                                    child: Icon(Icons.remove,color: kScaleButtonColor,),
                                  ),
                                  const SizedBox(width: 10,),
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: kBackgroundColor,
                                    shape: ShapeBorder.lerp(
                                      CircleBorder(), 
                                      CircleBorder(),
                                      0.5
                                     ),
                                    onPressed: (){                                   
                                          if( age < 100) {age++;}                                        
                                      var bmiValue = calculateBMI(weight:weight, height:height);
                                      setState(() {
                                        bmi = bmiValue;
                                      });///this
                                    } ,
                                    child: Icon(Icons.add, color: kScaleButtonColor,),
                                  ),
                                ],
                              )
                            ],),
                          ),
                        ),                    
                    ],
                  )              
              ]            
              ),
            ),
           
            Container(
              decoration: kTileBorderDecoration,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("Your BMI",
                    style: TextStyle(
                      color: kActiveTextColor,
                      fontSize: 24,
                    )
                  ),
                  Text(
                   bmi.toStringAsFixed(1),
                    style: TextStyle(
                      color: getBMIColor(bmi),
                      fontSize: 50,fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            
      
            ),
        
            
          ],       
        ),
      )
    );
  }
}