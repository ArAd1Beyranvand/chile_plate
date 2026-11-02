import 'package:plate_core/plate_core.dart';

import 'easter_island_colors.dart';

/// Easter Island as a `PlateCountry`: no side panel and no flag; the
/// province caption is a [PlateLabel] on each spec.
abstract final class EasterIslandCountry {
  static const PlateCountry easter_island = PlateCountry(
    code: 'ea',
    captionLines: <String>[],
    panelColor: EasterIslandColors.grey,
    panelTextColor: EasterIslandColors.red,
  );
}
