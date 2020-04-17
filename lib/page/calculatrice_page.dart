import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatricePage extends StatefulWidget {
  @override
  _CalculatricePageState createState() => _CalculatricePageState();
}

class _CalculatricePageState extends State<CalculatricePage> {
  String _saisie = "";
  String _romanNumber = "";
  bool _afterResult = false;
  bool _isTapDown = false;

  @override
  Widget build(BuildContext context) {
    double num = 10.889;
    String numRomanized = _romanized(num);
    print(numRomanized);

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            _saisie,
                            style: TextStyle(fontSize: 45),
                            textAlign: TextAlign.end,
                          )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            _romanNumber,
                            style: TextStyle(fontSize: 45),
                            textAlign: TextAlign.end,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.orange,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button('', '', ''),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child: Text('c',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              _clearText();
                            },
                          ),
                        ],
                      ),
                      _button('', '', ''),
                      _button('x', '', 'x'),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.orange,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button('VII', '', '7'),
                      _button('VIII', '', '8'),
                      _button('IX', '', '9'),
                      _button('/', '', '/'),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.orange,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button('IV', '', '4'),
                      _button('V', '', '5'),
                      _button('VI', '', '6'),
                      _button('+', '', '+'),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.orange,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button('I', '', '1'),
                      _button('II', '', '2'),
                      _button('III', '', '3'),
                      _button('-', '', '-'),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.orange,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button('', '', ''),
                      _button('0', '', '0'),
                      _button('', '', ''),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child:
                                Icon(Icons.arrow_forward, color: Colors.green),
                            onPressed: () {
                              _calculate();
                            },
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _button(title, function, number) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            color: Colors.orange,
            child: Text(title,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                )),
            onPressed: () {
              _changeText(number);
            },
          ),
        ],
      ),
    );
  }

  _calculate() {
    Parser p = Parser();
    Expression exp = p.parse(_saisie);
    ContextModel cm = ContextModel();

    // Evaluate expression:
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    _result(eval.toStringAsFixed(3));
  }

  _changeText(addText) {
    if (_afterResult == true) {
      _afterResult = false;
      _saisie = "";
    }
    setState(() {
      _saisie = _saisie + addText.toString();
    });
  }

  _clearText() {
    _afterResult = false;
    setState(() {
      _saisie = "0";
      _romanNumber = "";
    });
  }

  _result(result) {
    setState(() {
      _saisie = result;
      _romanNumber = _romanized(result);
    });
    _afterResult = true;
  }

  String _romanized(num) {
    var result = "";

    // Pour sliter si il y a une virgule
    var splited = num.toString().split(".");
    String romanizedNombre = _calculatedRomanize(splited[0]);
    String romanizedDecimal = _calculatedRomanize(splited[1]);

    if (splited[1] != "000") {
      result = romanizedNombre + "." + romanizedDecimal;
    } else {
      result = romanizedNombre;
    }

    return result;
  }

  _calculatedRomanize(numString) {
    int num = int.parse(numString);
    var decimalValue = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    var romanNumeral = [
      "M",
      "CM",
      "D",
      "CD",
      "C",
      "XC",
      "L",
      "XL",
      "X",
      "IX",
      "V",
      "IV",
      "I"
    ];

    var romanized = "";

    for (var index = 0; index < decimalValue.length; index++) {
      while (decimalValue[index] <= num) {
        romanized += romanNumeral[index];
        num -= decimalValue[index];
      }
    }

    return romanized;
  }
}
