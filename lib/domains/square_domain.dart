import 'dart:math';

import 'package:discorverflutter/domains/shape_domain.dart';

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}
