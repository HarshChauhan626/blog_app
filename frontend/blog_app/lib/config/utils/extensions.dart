// extension on String


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
