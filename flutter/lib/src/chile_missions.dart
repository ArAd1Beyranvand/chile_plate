import 'package:plate_core/plate_core.dart';

/// The two digits after `CD`/`CC` on a diplomatic plate name the mission. The
/// article's list has 39 for Israel, which is refused: [restriction] rides on
/// the diplomatic spec so `plate_core` refuses it in every layer. Nothing in
/// this package stores it.
abstract final class ChileMissions {
  /// The error every layer shows for a refused code.
  static const String notFound = 'COUNTRY NOT FOUND';

  /// Codes no layer may store.
  static const List<String> refused = <String>['39'];

  static const PlateRestriction restriction = PlateRestriction(
    group: 'mission',
    values: refused,
    reason: notFound,
  );

  static bool isRefused(String code) => refused.contains(code);
}
