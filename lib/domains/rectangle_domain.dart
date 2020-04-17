import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  // Pas besoin de d'affecter les paramètres du constructeur au variable de l'objet
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}
