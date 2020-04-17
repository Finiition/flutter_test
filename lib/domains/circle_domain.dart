import 'dart:math';

import 'package:discorverflutter/domains/shape_domain.dart';

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}
