import 'package:flutter/cupertino.dart';

extension DeviceInfo on BuildContext {
  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
