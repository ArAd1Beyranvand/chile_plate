import 'package:plate_core/plate_core.dart';

import 'chile_colors.dart';

/// Chile as a `PlateCountry`: no side panel and no flag. `CHILE` is a
/// [PlateLabel] on each spec, so [captionLines] is empty.
abstract final class ChileCountry {
  static const PlateCountry chile = PlateCountry(
    code: 'cl',
    captionLines: <String>[],
    panelColor: ChileColors.white,
    panelTextColor: ChileColors.black,
  );
}
