FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Chile to view examples:

https://platexample.ir/#/discover/chile:kotlin

# chile_plate

Chile's licence plates for the plate_core library — the black-on-white private plate and the orange provisional plate, with themes, alphabets and an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/chile_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/chile:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/chile_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/chile:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/chile_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/chile:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/chile_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/chile:typescript) |

## Quick start

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/chile/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.chile.country

val spec = country.specs["cl.private"]
println(country.pkg)
```

## Specs

The specs are the same in every language (they come from shared data).

- `cl.private`
- `cl.bus`
- `cl.trailer`
- `cl.trailer.light`
- `cl.diplomatic`
- `cl.police`
- `cl.provisional`
- `ea.easter_island`
- `ea.juan_fernandez`

## Themes

- `ChileThemes.private`
- `ChileThemes.taxi`
- `ChileThemes.collectiveTaxi`
- `ChileThemes.radiotaxi`
- `ChileThemes.bus`
- `ChileThemes.freeZone`
- `ChileThemes.lightTrailer`
- `ChileThemes.diplomatic`
- `ChileThemes.police`
- `EasterIslandThemes.easterIsland`
- `EasterIslandThemes.juanFernandez`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`ChileValidator`, `EasterIslandValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/chile_plate/blob/main/LICENSE).
