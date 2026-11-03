"""Port of chile_plate/lib/src/easter_island/src/easter_island_validators.dart."""

from plates.core.validators.plate_validator import PlateCheck, RuledPlateValidator


class EasterIslandValidator(RuledPlateValidator):
    checks = (
        PlateCheck("letters", r"[A-Z]{3}", "The plate starts with three letters."),
        PlateCheck("number", r"[0-9]{3}", "The number is three digits."),
    )
