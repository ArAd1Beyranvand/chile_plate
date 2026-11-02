"""Port of chile_plate/lib/src/easter_island/src/easter_island_validators.dart."""
from __future__ import annotations

import re
from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length


class EasterIslandValidator(GatedPlateValidator):
    gate_group = 'number'
    _letters = re.compile(r"^[A-Z]{3}$")
    reason_letters = "The plate starts with three letters."
    reason_number = "The number is three digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not self._letters.fullmatch(entry.group("letters")):
            return PlateValidation.invalid(self.reason_letters)
        if not is_digits_of_length(entry.group("number"), 3):
            return PlateValidation.invalid(self.reason_number)
        return PlateValidation.valid()
