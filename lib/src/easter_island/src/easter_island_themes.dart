import 'package:flutter/widgets.dart' show Color;
import 'package:plate_core/plate_core.dart';

import 'easter_island_colors.dart';

/// One ink on one field. The frame width and corner radius are estimated from
/// the references (a thin embossed edge), not measured.
abstract final class EasterIslandThemes {
  static final PlateTheme easterIsland = _framed(EasterIslandColors.grey, EasterIslandColors.red);
  static final PlateTheme juanFernandez = _framed(
    EasterIslandColors.orange,
    EasterIslandColors.blue,
  );
}

PlateTheme _framed(Color field, Color ink) => PlateTheme.monochrome(
  field: field,
  ink: ink,
  inactive: EasterIslandColors.inactive,
  borderWidthRatio: 0.02,
  plateRadiusRatio: 0.05,
);
