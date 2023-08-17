import 'dart:math';

class Point {
  late final double x;
  late final double y;
  late final double z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(1, 1, 1);
  }

  // Возвращает дистанцию
  double distanceTo(Point b) {
    double dx = b.x - x;
    double dy = b.y - y;
    double dz = b.z - z;

    return sqrt(pow(dx, 2) + pow(dy, 2) + pow(dz, 2));
  }
}
