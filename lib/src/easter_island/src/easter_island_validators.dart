import 'package:plate_core/plate_core.dart';

/// Judges an `ABC 123` plate: groups `letters` (three Latin capitals) and
/// `number` (three digits). Reports, never bars a keystroke.
class EasterIslandValidator extends GatedPlateValidator {
  const EasterIslandValidator();

  @override
  String get gateGroup => 'number';

  static const String reasonLetters = 'The plate starts with three letters.';
  static const String reasonNumber = 'The number is three digits.';

  static final RegExp _letters = RegExp(r'^[A-Z]{3}$');

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!_letters.hasMatch(entry.group('letters'))) {
      return const PlateValidation.invalid(reasonLetters);
    }
    if (!isDigitsOfLength(entry.group('number'), 3)) {
      return const PlateValidation.invalid(reasonNumber);
    }
    return const PlateValidation.valid();
  }
}
