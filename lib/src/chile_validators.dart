import 'package:plate_core/plate_core.dart';

import 'chile_missions.dart';

/// Judges a Chilean plate by which groups it has:
///
/// - `first`, `second`, `number`: four consonants and two digits (`BB·BB·10`),
///   or on a trailer two letters and two pairs of digits (`JD·20·67`).
/// - `first`, `mission`, `number`: diplomatic, two prefix letters and four
///   digits; the mission pair 39 is refused by [ChileMissions.restriction].
/// - `first` of three letters and `number` of three digits: a light trailer.
/// - `first` and `number` otherwise: `PR` and three or four digits is
///   provisional, any other letters and four digits are a police plate.
///
/// The letters of the 2007 format leave out the vowels, M, N, Ñ and Q.
/// Reports, never bars a keystroke.
class ChileValidator extends GatedPlateValidator {
  const ChileValidator();

  @override
  String get gateGroup => 'number';

  static const String reasonLetters =
      'The letters are consonants (no M, N, Ñ or Q).';
  static const String reasonNumber = 'The number is two digits.';
  static const String reasonDiplomatic =
      'A diplomatic plate starts CD, CC, AT, CH, OI or PAT.';
  static const String reasonTrailer =
      'A trailer plate is two letters and two '
      'pairs of digits.';
  static const String reasonLight =
      'A light trailer is three consonants and '
      'three digits.';
  static const String reasonProvisional =
      'A provisional plate is PR and three '
      'or four digits.';
  static const String reasonPolice =
      'A police plate is letters and four '
      'digits.';

  static final RegExp _consonants = RegExp(r'^[BCDFGHJKLPRSTVWXYZ]+$');
  static final RegExp _letters = RegExp(r'^[A-Z]+$');
  static final RegExp _digits = RegExp(r'^[0-9]+$');
  static const List<String> _diplomaticPrefixes = <String>[
    'CD', 'CC', 'AT', 'CH', 'OI', 'PAT', //
  ];

  @override
  PlateValidation judge(PlateEntry entry) {
    final String first = entry.group('first');
    final String second = entry.group('second');
    final String mission = entry.group('mission');
    final String number = entry.group('number');

    if (mission.isNotEmpty) {
      if (!_diplomaticPrefixes.contains(first)) {
        return const PlateValidation.invalid(reasonDiplomatic);
      }
      if (!isDigitsOfLength(mission, 2) || !isDigitsOfLength(number, 2)) {
        return const PlateValidation.invalid(reasonNumber);
      }
      return const PlateValidation.valid();
    }
    if (second.isNotEmpty) {
      if (_digits.hasMatch(second)) {
        if (!_letters.hasMatch(first) ||
            !isDigitsOfLength(second, 2) ||
            !isDigitsOfLength(number, 2)) {
          return const PlateValidation.invalid(reasonTrailer);
        }
        return const PlateValidation.valid();
      }
      if (!_consonants.hasMatch(first) || !_consonants.hasMatch(second)) {
        return const PlateValidation.invalid(reasonLetters);
      }
      if (!isDigitsOfLength(number, 2)) {
        return const PlateValidation.invalid(reasonNumber);
      }
      return const PlateValidation.valid();
    }
    if (first.length == 3) {
      if (!_consonants.hasMatch(first) || !isDigitsOfLength(number, 3)) {
        return const PlateValidation.invalid(reasonLight);
      }
      return const PlateValidation.valid();
    }
    if (first == 'PR') {
      if (!isDigitsOfLength(number, 3) && !isDigitsOfLength(number, 4)) {
        return const PlateValidation.invalid(reasonProvisional);
      }
      return const PlateValidation.valid();
    }
    if (!_letters.hasMatch(first) || !isDigitsOfLength(number, 4)) {
      return const PlateValidation.invalid(reasonPolice);
    }
    return const PlateValidation.valid();
  }
}
