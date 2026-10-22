import 'package:flutter/widgets.dart' show Color;
import 'package:plate_core/plate_core.dart';

import 'chile_colors.dart';

/// One ink on one field, the frame in the ink's colour (the overview draws
/// white frames on the red, orange and blue plates and black on the rest). The
/// frame is ~2 of 53 px, so 4.9 of 130 units: 0.03 here; the corner radius is
/// estimated from the overview (~0.06), not measured.
///
/// The trailer plate is the private plate's colours and the provisional plate
/// the taxi's, so each is an alias.
abstract final class ChileThemes {
  static final PlateTheme private = _framed(ChileColors.white, ChileColors.black);
  static final PlateTheme taxi = _framed(ChileColors.orange, ChileColors.black);
  static final PlateTheme collectiveTaxi = _framed(ChileColors.yellow, ChileColors.black);
  static final PlateTheme radiotaxi = _framed(ChileColors.orange, ChileColors.white);
  static final PlateTheme bus = _framed(ChileColors.white, ChileColors.green);
  static final PlateTheme freeZone = _framed(ChileColors.red, ChileColors.white);
  static final PlateTheme trailer = private;
  static final PlateTheme lightTrailer = _framed(ChileColors.white, ChileColors.trailerRed);
  static final PlateTheme diplomatic = _framed(ChileColors.blue, ChileColors.white);
  static final PlateTheme police = _framed(ChileColors.black, ChileColors.white);
  static final PlateTheme provisional = taxi;
}

PlateTheme _framed(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: ChileColors.inactive,
  borderWidthRatio: 0.03,
  plateRadiusRatio: 0.06,
);
