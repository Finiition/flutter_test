import 'dart:math';

import 'package:discorverflutter/domains/bicycle_domain.dart';
import 'package:discorverflutter/domains/circle_domain.dart';
import 'package:discorverflutter/domains/rectangle_domain.dart';
import 'package:discorverflutter/domains/shape_domain.dart';
import 'package:discorverflutter/domains/square_domain.dart';
import 'package:flutter/material.dart';

class Exercice1 extends StatefulWidget {
  @override
  _Exercice1State createState() => _Exercice1State();
}

class _Exercice1State extends State<Exercice1> {
  @override
  Widget build(BuildContext context) {
    // Bicycle
    print(Bicycle(2, 1));

    // Rectangle
    print("Rectangle 1 : " +
        Rectangle(origin: const Point(10, 20), width: 100, height: 200)
            .toString());
    print("Rectangle 2 : " + Rectangle(origin: const Point(10, 10)).toString());
    print("Rectangle 3 : " + Rectangle(width: 200).toString());
    print("Rectangle 4 : " + Rectangle().toString());

    // Square and Circle
    print("Circle : " + Circle(2).area.toString());
    print("Square : " + Square(2).area.toString());

    // Shape Factory
    print("Circle with factory : " + shapeFactory('circle').area.toString());
    print("Square with factory : " + shapeFactory('square').area.toString());

    // Shape Factory in constructor
    print("Circle with factory in constructor : " +
        Shape('circle').area.toString());
    print("Square with factory in constructor : " +
        Shape('square').area.toString());

    // Scream
    final values = [1, 2, 3, 5, 10, 50];
    values.skip(1).skip(2).take(50).map(scream).forEach(print);

    // Affichage image
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 1'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('graphics/chomusuke.gif'))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Text(
            'Tout est dans la console',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 48),
          ))
        ],
      ),
    );
  }

  String scream(int length) => "Nya${'a' * length}!";

  Shape shapeFactory(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
}
