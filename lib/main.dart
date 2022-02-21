import 'package:demo/Provider/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context,_){
        final themeProvider = Provider.of<ThemeProvider>(context);
         return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          darkTheme: CustomTheme.darkThemeData,
          debugShowCheckedModeBanner: false,
          theme:CustomTheme.lightThemeData,
          home: MyCalculator(),
        );
      },
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
  List<String> inputArray = [];
  String number = '';
  bool resultState = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          DropdownButton<String>(
            icon: Icon(Icons.more_vert,color: Colors.white,),
            items: <String>['Dark Theme', 'Light Theme'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (v) {
                  if(v=='Dark Theme') {
                    final provider = Provider.of<ThemeProvider>(context, listen: false);
                    provider.toggleTheme(true);
                  }
                  else
                    {
                      final provider = Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(false);
                    }
            },
          )
        ],
      ),
        body: Container(
          padding: EdgeInsets.all(10),
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text(answer!=0 ? answer.toString() : inputString!=''? inputString : '0',style: TextStyle(fontSize: 55),)),
              Wrap(
                spacing: 1,
                children: [
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
                      button('7',null),
                      button('8',null),
                      button('9',null),
                      button('x',Colors.orangeAccent.shade100),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button('4',null),
                      button('5',null),
                      button('6',null),
                      button('-',Colors.orangeAccent.shade100),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button('1',null),
                      button('2',null),
                      button('3',null),
                      button('+',Colors.orangeAccent.shade100),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),),
                        child: Container(
                          width: width*0.35,
                          height: height*0.08,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '0',
                              style: Theme.of(context).textTheme.headline1,
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
                              number = number + '0';
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
                      button('.',null),
                      button('=',Colors.orangeAccent.shade100),
                    ],
                  )
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
            shape: const CircleBorder(),),
        child: Container(
          width: width*0.1,
          height: height*0.1,
          alignment: Alignment.center,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Text(
            text,
            style: color==null ? Theme.of(context).textTheme.headline1 : TextStyle(fontSize: 24,color: color,fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          if(text!='AC' && text!='+/-' && text!='=' ) {
            if(operators.contains(text)){
              setState(() {
                inputArray.add(number);
                number = '';
              });
            }
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
                    inputArray.clear();
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
                    inputArray.clear();
                    number = '';
                    answer = 0;
                    resultState = false;
                  });
                }
                setState(() {
                  if(operators.contains(text))
                    {
                      inputArray.add(text);
                      inputString = inputString + text;
                      resultState = false;
                    }
                  else{
                    inputString = inputString + text;
                    number = number+text;
                    resultState = false;
                  }
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
            setState(() {
              inputArray.add(number);
              inputArray.removeWhere((element) => element=='');
              number = '';
            });
            //performDivide();
            equalPressed(text);
          }
          else if(text=='+/-'){
            setState(() {
              inputArray.add(number);
              inputArray.forEach((element) {
                print('input array '+ element);
              });
              var lastVal = inputArray[inputArray.length-1];
              inputArray[inputArray.length-1] = (double.parse(number)*(-1)).toString();
              var str = inputString.split('');
              str.add('('+(double.parse(number)*(-1)).toString()+')');
              //str.
              inputString = str.join();
              setState(() {
                number = '';
              });
              print('inp string '+inputString);
              inputArray.forEach((element) {
                print('input array '+ element);
              });
              /*var str = inputString.split('');
              str.removeLast();
              inputString = str.join();*/
              /*var no = inputArray[inputArray.length-1];
              print(no);
              //inputArray.replaceRange(inputArray.length-1, inputArray.length-1, no*(-1));
              inputArray[inputArray.length-1] = (no*(-1)).toString();*/
            });
            inputArray.forEach((element) {
              print('input array '+ element);
            });
          }
          else if(text=='AC'){
            setState(() {
              inputArray.clear();
              inputString='';
              answer=0;
              number = '';
              resultState=false;
            });
          }
        },
      ),
    );
  }
  void equalPressed(String text) {
    inputArray.forEach((element) {
      print(element);
    });
    print('length '+inputArray.length.toString());
    try {
      solveExpression();
      print('final result ' + answer.toString());
      setState(() {
        resultState = true;
        number = '';
        inputString = answer.toString();
        answer = 0;
      });
    }
    catch (e){
      setState(() {
        inputString='';
        inputArray.clear();
        answer=0;
        number = '';
      });
    }
  }

  solveExpression(){
    if(inputArray.length==1) {
      setState(() {
        resultState = true;
        answer = double.parse(inputArray[0]);
      });
      return inputArray[0];
    }

    if(inputArray.contains('%')){
      inputArray.forEach((element) {
        print('input array '+ element);
      });
      performPerc();
    }
    else if(inputArray.contains('÷')){
      inputArray.forEach((element) {
        print('input array '+ element);
      });
      performDivide();
    }
    else if(inputArray.contains('x'))
      {
        inputArray.forEach((element) {
          print('input array '+ element);
        });
        performMult();
      }
    else if(inputArray.contains('+')){
      inputArray.forEach((element) {
        print('input array '+ element);
      });
      performAdd();
    }
    else if(inputArray.contains('-')){
      inputArray.forEach((element) {
        print('input array '+ element);
      });
      performSub();
    }
    solveExpression();
  }

  performPerc(){
    var index = inputArray.indexOf('%');
    print('index '+index.toString());
    var result = (double.parse(inputArray[index-1])*100)/double.parse(inputArray[index+1]);
    print('result '+result.toString());
    inputArray[index-1] = result.toString();
    inputArray[index]='';
    inputArray[index+1]='';
    print('new line');
    inputArray.removeWhere((element) => element=='');
  }

  performDivide(){
    var index = inputArray.indexOf('÷');
    print('index '+index.toString());
    var result = double.parse(inputArray[index-1])/double.parse(inputArray[index+1]);
    print('result '+result.toString());
    inputArray[index-1] = result.toString();
    inputArray[index]='';
    inputArray[index+1]='';
    print('new line');
    inputArray.removeWhere((element) => element=='');
  }
  performMult(){
    var index = inputArray.indexOf('x');
    print('index '+index.toString());
    var result = double.parse(inputArray[index-1])*double.parse(inputArray[index+1]);
    print('result '+result.toString());
    inputArray[index-1] = result.toString();
    inputArray[index]='';
    inputArray[index+1]='';
    print('new line');
    inputArray.removeWhere((element) => element=='');
  }

  performAdd(){
    var index = inputArray.indexOf('+');
    print('index '+index.toString());
    var result = double.parse(inputArray[index-1])+double.parse(inputArray[index+1]);
    print('result '+result.toString());
    inputArray[index-1] = result.toString();
    inputArray[index]='';
    inputArray[index+1]='';
    print('new line');
    inputArray.removeWhere((element) => element=='');
  }

  performSub(){
    var index = inputArray.indexOf('-');
    print('index '+index.toString());
    var result = double.parse(inputArray[index-1])-double.parse(inputArray[index+1]);
    print('result '+result.toString());
    inputArray[index-1] = result.toString();
    inputArray[index]='';
    inputArray[index+1]='';
    print('new line');
    inputArray.removeWhere((element) => element=='');
  }

}

