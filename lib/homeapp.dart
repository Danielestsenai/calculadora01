import 'package:flutter/material.dart';
import 'package:calculadora/homeapp.dart';

class homeApp extends StatefulWidget {
  const homeApp({Key? key}) : super(key: key);

  @override
  _homeAppState createState() => _homeAppState();
}

class _homeAppState extends State<homeApp> {
  String output = "0";
  String out = "0";
  String operand = "";
  double num1 = 0.0;
  double num2 = 0.0;
  bottonPressed(String btnval) {
    print(btnval);
    if (btnval == "c") {
      out = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "*" ||
        btnval == "/") {
      num1 = double.parse(output);
      operand = operand + btnval;
      out = "0";
      output = output + btnval;
    } else if (btnval == ".") {
      if (out.contains(".")) {
        print("ja existe");
        return;
      } else {
        out = out + btnval;
      }
    } else if (btnval == "-") {
      num2 = double.parse(output);
      if (operand == "+") {
        out = (num1 + num2).toString();
      }
      if (operand == "-") {
        out = (num1 - num2).toString();
      }
      if (operand == "*") {
        out = (num1 * num2).toString();
      }
      if (operand == "/") {
        out = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
    } else {
      out = out + btnval;
    }
    setState(() {
      output = double.parse(out).toStringAsFixed(2); //34.5 = 14,50
    });
  }

  Widget buildButton(String ButtonVal) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-2.0, -2.0),
                      blurRadius: 8.0,
                      spreadRadius: 1.0),
                ]),
            child: MaterialButton(
              padding: EdgeInsets.all(30.0),
              child: Text(
                ButtonVal,
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () => bottonPressed(ButtonVal),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
              child: Text(
                output,
                style: TextStyle(fontSize: 60.0),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("C"),
                    buildButton("<-"),
                    buildButton("*")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("+")
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ],
                ),
                Row(
                  children: <Widget>[buildButton("0"), buildButton("=")],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
