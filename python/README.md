FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Chile to view examples:

https://platexample.ir/#/discover/chile:python

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

### Install (Python)

Copy `python/plates/countries/chile/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.chile.data import SPECS, THEMES

spec = SPECS["cl.private"]
theme = THEMES["ChileThemes.private"]
print(spec.id)
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

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `ChileValidator`, `EasterIslandValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/chile_plate/blob/main/LICENSE).
