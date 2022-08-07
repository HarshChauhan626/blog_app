
import 'package:flutter/material.dart';
import 'constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Globals.EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Globals.ZERO;
    } else {
      return this!;
    }
  }
}

extension ColorTintGenerator on Color{
  Color darken([int percent=10]){
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
        alpha,
        (red * f).round(),
        (green  * f).round(),
        (blue * f).round()
    );
  }

  Color lighten([int percent=10]){
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        alpha,
        red + ((255 - red) * p).round(),
        green + ((255 - green) * p).round(),
        blue + ((255 - blue) * p).round()
    );
  }


}

