import 'package:flutter/widgets.dart';

/// Modal pixels of the flattened reference plates: the Easter Island plate is
/// red `C70000` on light grey `E8E8E8`, the Juan Fernández plate blue `0057D0`
/// on orange `FF9F51`.
abstract final class EasterIslandColors {
  static const Color grey = Color(0xFFE8E8E8);
  static const Color red = Color(0xFFC70000);
  static const Color orange = Color(0xFFFF9F51);
  static const Color blue = Color(0xFF0057D0);
  static const Color inactive = Color(0xFFB0B0B0);
}
