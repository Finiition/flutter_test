import 'circle_domain.dart';
import 'square_domain.dart';

abstract class Shape {
  num get area;

  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
}
