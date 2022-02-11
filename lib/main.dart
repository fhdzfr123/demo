import 'package:demo/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double answer = 0.0;
  String inputString = '';
  List<String> operators = ['+','-','x','÷','%'];
  String number = '';
  bool resultState = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.topRight,
                  child: Text(answer!=0 ? answer.toString() : inputString!=''? inputString : '0',style: TextStyle(fontSize: 55),)),
            ),
            SizedBox(
              height: height*0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('AC',Colors.grey),
                button('+/-',Colors.grey),
                button('%',Colors.grey),
                button('÷',Colors.orangeAccent.shade100),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('7',Colors.black),
                button('8',Colors.black),
                button('9',Colors.black),
                button('x',Colors.orangeAccent.shade100),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('4',Colors.black),
                button('5',Colors.black),
                button('6',Colors.black),
                button('-',Colors.orangeAccent.shade100),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button('1',Colors.black),
                button('2',Colors.black),
                button('3',Colors.black),
                button('+',Colors.orangeAccent.shade100),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))), primary: Colors.white),
                  child: Container(
                    width: width*0.35,
                    height: height*0.08,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 24,color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if(resultState)
                      {
                        setState(() {
                          inputString = '';
                          number = '';
                          answer = 0;
                          resultState = false;
                        });
                      }
                    if(inputString!='') {
                      setState(() {
                        inputString = inputString + '0';
                      });
                      print('0');
                    }
                  },
                ),
                SizedBox(width: width*0.05,),
                /*Container(
                  child: PhysicalShape(
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 4,
                    clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                    child: Container(
                      padding: EdgeInsets.only(top: height*0.02,left: width*0.04),
                      height: height*0.08,
                      width: width*0.45,
                      child: Text('0',style: TextStyle(fontSize: 30),textAlign: TextAlign.left,),
                    ),
                  ),
                ),*/
                button('.',Colors.black),
                button('=',Colors.orangeAccent.shade100),
              ],
            )
          ],
        ),
      )
    );
}

  Widget button(String text,Color? color){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), primary: Colors.white),
        child: Container(
          width: width*0.1,
          height: height*0.1,
          alignment: Alignment.center,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Text(
            text,
            style: TextStyle(fontSize: 24,color: color),
          ),
        ),
        onPressed: () {
          if(text!='AC' && text!='+/-' && text!='=' ) {
            if(inputString.length>=1)
              {
                if(operators.contains(inputString[inputString.length-1]) && operators.contains(text))
                  {
                    print('here');
                    setState(() {
                      var str = inputString.split('');
                      str.removeLast();
                      inputString = str.join();
                      inputString = inputString + text;
                      number = '';
                    });
                    print(text);
                  }
                else if(number.contains('.')){
                  if(resultState)
                  {
                    setState(() {
                      inputString = '';
                      number = '';
                      answer = 0;
                      resultState = false;
                    });
                  }
                   if(text!='.'){
                   setState(() {
                   inputString = inputString + text;
                   number = number+text;
                   });
                   print(text);
                   }
                }
                else{
                  if(resultState && !operators.contains(text))
                  {
                    setState(() {
                      inputString = '';
                      number = '';
                      answer = 0;
                      resultState = false;
                    });
                  }
                  setState(() {
                    inputString = inputString + text;
                    number = number+text;
                    resultState = false;
                  });
                  print(text);
                }
              }
            else{
              setState(() {
                inputString = inputString + text;
                number = number+text;
              });
              print(text);
            }
          }
          else if(text=='='){
            equalPressed();
          }
          else if(text=='AC'){
            setState(() {
              inputString='';
              answer=0;
            });
          }
        },
      ),
    );
  }
  void equalPressed() {
    try {
      String finaluserinput = inputString;
      finaluserinput = inputString.replaceAll('x', '*');
      //finaluserinput = '100%2';
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        inputString = eval.toString();
        resultState = true;
        //inputString = answer.toString();
        //answer = 0;
      });
    }
    catch (e){
      setState(() {
        inputString='';
        answer=0;
      });
    }
  }
}


/*Container(
child: PhysicalShape(
color: Colors.white,
shadowColor: Colors.grey.shade200,
elevation: 4,
clipper: ShapeBorderClipper(shape: CircleBorder()),
child: Container(
height: 75,
width: 75,
child: Center(
child: Text(text,style: TextStyle(fontSize: 30,color: color,fontFamily: 'Schyler'),),
),
),
),
)*/



/*
class Button extends StatelessWidget {
  final String? text;
  const Button({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhysicalShape(
        color: Colors.white,
        shadowColor: Colors.grey.shade200,
        elevation: 4,
        clipper: ShapeBorderClipper(shape: CircleBorder()),
        child: Container(
          height: 75,
          width: 75,
          child: Center(
            child: Text(this.text.toString(),style: TextStyle(fontSize: 30),),
          ),
        ),
      ),
    );
  }
}
*/

