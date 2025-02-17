import 'package:flutter/material.dart';
import 'package:fxdyfvh/widgets/button_widget.dart';

import '../widgets/result_screen_widget.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  String _output = '0';
  String _input = '';
  String operand = '';
  double num1 = 0;
  double num2 = 0;
  String expression = '';

  void buttonPressed(String value){
    setState(() {
      if(value == 'AC'){
        _output = '0';
        _input = '';
        operand = '';
        num1 = 0;
        num2 = 0;
        expression = '';
      }else if(value == '='){
        num2 = double.parse(_input);
        if(operand == '+'){
          _output = (num1+num2).toString();
        }else if(operand == '-'){
          _output = (num1-num2).toString();
        }else if(operand == 'x'){
          _output = (num1*num2).toString();
        }else if(operand == '/'){
          _output = (num2 != 0) ? (num1/num2).toString() : "Syntax Error";
        }
        _input = _output;
      }else if(['+','-','x','/'].contains(value)){
        num1 = double.parse(_input);
        operand = value;
        expression += value;
        _input = num1.toString() + operand.toString();
        _output = _input;
        _input = '';
      }else if(value == 'C'){
        _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : "";
        expression = expression.length > 1 ? expression.substring(0, expression.length - 1) : "";
        _input = _output;
      }else if (value == "%") {
        double currentValue = double.tryParse(_output) ?? 0;
        _output = (currentValue / 100).toString();
        expression += value;
        _input = _output;
      }else{
        _input += value;
        expression += value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculator",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ResultScreenWidget(screenWidth: screenWidth, displayText: _output,expression: expression,),
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ButtonWidget(text: 'AC',bgColor: Colors.deepPurpleAccent,onClick: ()=> buttonPressed('AC'),),
                        ButtonWidget(text: '⌫',bgColor: Colors.deepPurpleAccent,onClick: ()=> buttonPressed('C'),),
                        ButtonWidget(text: '%',bgColor: Colors.deepPurpleAccent,onClick: ()=> buttonPressed('%'),),
                        ButtonWidget(text: '/',bgColor: Colors.deepPurpleAccent,onClick: ()=> buttonPressed('/'),),
                      ]
                    ),
                    Row(
                        children: [
                          ButtonWidget(text: '7',onClick: ()=> buttonPressed('7'),),
                          ButtonWidget(text: '8',onClick: ()=> buttonPressed('8'),),
                          ButtonWidget(text: '9',onClick: ()=> buttonPressed('9'),),
                          ButtonWidget(text: 'x',bgColor: Colors.deepPurpleAccent,onClick: ()=> buttonPressed('x'),),
                        ]
                    ),
                    Row(
                        children: [
                          ButtonWidget(text: '4',onClick: ()=> buttonPressed('4'),),
                          ButtonWidget(text: '5',onClick: ()=> buttonPressed('5'),),
                          ButtonWidget(text: '6',onClick: ()=> buttonPressed('6'),),
                          ButtonWidget(text: '-',bgColor: Colors.deepPurpleAccent,onClick: ()=> buttonPressed('-'),),
                        ]
                    ),
                    Row(
                        children: [
                          ButtonWidget(text: '1',onClick: ()=> buttonPressed('1'),),
                          ButtonWidget(text: '2',onClick: ()=> buttonPressed('2'),),
                          ButtonWidget(text: '3',onClick: ()=> buttonPressed('3'),),
                          ButtonWidget(text: '+',bgColor: Colors.deepPurpleAccent,onClick: ()=> buttonPressed('+'),),
                        ]
                    ),
                    Row(
                        children: [
                          ButtonWidget(text: '00',onClick: ()=> buttonPressed('00'),),
                          ButtonWidget(text: '0',onClick: ()=> buttonPressed('0'),),
                          ButtonWidget(text: '.',onClick: ()=> buttonPressed('.'),),
                          ButtonWidget(text: '=',bgColor: Colors.white, frColor: Colors.black,onClick: ()=> buttonPressed('='),),
                        ]
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


