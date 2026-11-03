package plates.countries.chile

import plates.core.validators.PlateCheck
import plates.core.validators.RuledPlateValidator

/** Judges an `ABC 123` plate: three Latin capitals and three digits. Reports, never bars a keystroke. */
class EasterIslandValidator : RuledPlateValidator() {
    override val checks = listOf(
        PlateCheck("letters", "[A-Z]{3}", "The plate starts with three letters."),
        PlateCheck("number", "[0-9]{3}", "The number is three digits."),
    )
}
