import 'package:plate_core/plate_core.dart';

/// Judges an `ABC 123` plate: groups `letters` (three Latin capitals) and
/// `number` (three digits). Reports, never bars a keystroke.
class EasterIslandValidator extends RuledPlateValidator {
  const EasterIslandValidator();

  static const String reasonLetters = 'The plate starts with three letters.';
  static const String reasonNumber = 'The number is three digits.';

  @override
  List<PlateCheck> get checks => const <PlateCheck>[
    PlateCheck('letters', r'[A-Z]{3}', reasonLetters),
    PlateCheck('number', r'[0-9]{3}', reasonNumber),
  ];
}
