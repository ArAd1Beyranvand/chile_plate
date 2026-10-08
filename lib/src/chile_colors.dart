import 'package:flutter/widgets.dart';

/// The colours of the Chilean plates, sampled as modal pixels from the vector
/// overview of the categories (`overview.png`): fields white, black,
/// orange `F1580C`, yellow `F1A724`, red `D21313` and light blue `5FBBDA`; the
/// bus plate's green ink `137F25` and the light trailer's red ink `CD1C1C`.
/// The photographs only carried their own lighting, so they are not used.
abstract final class ChileColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color orange = Color(0xFFF1580C);
  static const Color yellow = Color(0xFFF1A724);
  static const Color red = Color(0xFFD21313);
  static const Color blue = Color(0xFF5FBBDA);
  static const Color green = Color(0xFF137F25);
  static const Color trailerRed = Color(0xFFCD1C1C);
  static const Color inactive = Color(0xFFB0B0B0);
}
