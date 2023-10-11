import 'package:calculator/button_widget.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  // const Calculator({Key? key}) : super(key: key);
  static const String routName = "calculator";

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String resultTV = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    resultTV,
                    style: TextStyle(fontSize: 30),
                  ))),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtoonWidget(
                  "7",
                  onclickFun,
                ),
                ButtoonWidget("8", onclickFun),
                ButtoonWidget("9", onclickFun),
                ButtoonWidget("/", onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtoonWidget("4", onclickFun),
                ButtoonWidget("5", onclickFun),
                ButtoonWidget("6", onclickFun),
                ButtoonWidget("*", onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtoonWidget("1", onclickFun),
                ButtoonWidget("2", onclickFun),
                ButtoonWidget("3", onclickFun),
                ButtoonWidget("-", onOperatorClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtoonWidget("0", onclickFun),
                ButtoonWidget(".", onclickFun),
                ButtoonWidget("=", onclickFun),
                ButtoonWidget("+", onOperatorClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String savedOperator = '';
  String savedResult = '';

  void onOperatorClick(String operatorText) {
    if (savedOperator.isEmpty) {
      savedOperator = operatorText;
      savedResult = resultTV;
      resultTV = '';
    } else {
      String rhs = resultTV;
      savedResult = calculate(savedResult, savedOperator, rhs);
      savedOperator = operatorText;
      resultTV = '';
    }
    setState(() {});
  }

  void onclickFun(String digitText) {
    setState(() {
      resultTV += digitText;
    });
  }

  void onEqualCliced(String _) {
    String rhs = resultTV;
    savedResult = calculate(savedResult, savedOperator, rhs);
    resultTV = savedResult;
    savedOperator = '';
    savedResult = '';
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double res = 0;
    if (operator == '+') {
      res = n1 + n2;
    } else if (operator == '-') {
      res = n1 - n2;
    } else if (operator == '*') {
      res = n1 * n2;
    } else if (operator == '/') {
      res = n1 / n2;
    }
    return res.toString();
  }
}
