"""Port of chile_plate/lib/src/chile_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import (
    GatedPlateValidator, PlateEntry, PlateValidation, is_digits, is_digits_of_length)

_CONSONANTS = re.compile(r"[BCDFGHJKLPRSTVWXYZ]+")
_LETTERS = re.compile(r"[A-Z]+")
_DIPLOMATIC_PREFIXES = ("CD", "CC", "AT", "CH", "OI", "PAT")


class ChileValidator(GatedPlateValidator):
    gate_group = 'number'

    REASON_LETTERS = "The letters are consonants (no M, N, Ñ or Q)."
    REASON_NUMBER = "The number is two digits."
    REASON_DIPLOMATIC = "A diplomatic plate starts CD, CC, AT, CH, OI or PAT."
    REASON_TRAILER = "A trailer plate is two letters and two pairs of digits."
    REASON_LIGHT = "A light trailer is three consonants and three digits."
    REASON_PROVISIONAL = "A provisional plate is PR and three or four digits."
    REASON_POLICE = "A police plate is letters and four digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        first, second = entry.group("first"), entry.group("second")
        mission, number = entry.group("mission"), entry.group("number")
        invalid = PlateValidation.invalid

        if mission:
            if first not in _DIPLOMATIC_PREFIXES:
                return invalid(self.REASON_DIPLOMATIC)
            if not is_digits_of_length(mission, 2) or not is_digits_of_length(number, 2):
                return invalid(self.REASON_NUMBER)
            return PlateValidation.valid()
        if second:
            if is_digits(second):
                if (not _LETTERS.fullmatch(first) or not is_digits_of_length(second, 2)
                        or not is_digits_of_length(number, 2)):
                    return invalid(self.REASON_TRAILER)
                return PlateValidation.valid()
            if not _CONSONANTS.fullmatch(first) or not _CONSONANTS.fullmatch(second):
                return invalid(self.REASON_LETTERS)
            if not is_digits_of_length(number, 2):
                return invalid(self.REASON_NUMBER)
            return PlateValidation.valid()
        if len(first) == 3:
            if not _CONSONANTS.fullmatch(first) or not is_digits_of_length(number, 3):
                return invalid(self.REASON_LIGHT)
            return PlateValidation.valid()
        if first == "PR":
            if not is_digits_of_length(number, 3) and not is_digits_of_length(number, 4):
                return invalid(self.REASON_PROVISIONAL)
            return PlateValidation.valid()
        if not _LETTERS.fullmatch(first) or not is_digits_of_length(number, 4):
            return invalid(self.REASON_POLICE)
        return PlateValidation.valid()
