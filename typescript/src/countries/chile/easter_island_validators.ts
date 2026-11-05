import { PlateCheck, RuledPlateValidator } from 'plate_core/core/validators/plate_validator';

/** Judges an `ABC 123` plate: groups `letters` (three Latin capitals) and
 * `number` (three digits). Reports, never bars a keystroke. */
export class EasterIslandValidator extends RuledPlateValidator {
  readonly checks = [
    new PlateCheck('letters', '[A-Z]{3}', 'The plate starts with three letters.'),
    new PlateCheck('number', '[0-9]{3}', 'The number is three digits.'),
  ];
}
