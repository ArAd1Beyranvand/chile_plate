FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Chile to view examples:

https://platexample.ir/#/discover/chile:flutter

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

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  chile_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:chile_plate/chile_plate.dart';

PlateCanvas(
  spec: ChilePlates.private,
  theme: ChileThemes.private,
  validator: const ChileValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `ChilePlates.private`
- `ChilePlates.bus`
- `ChilePlates.trailer`
- `ChilePlates.lightTrailer`
- `ChilePlates.diplomatic`
- `ChilePlates.police`
- `ChilePlates.provisional`
- `ChilePlates.lightTrailerFor`(…)

## Themes

- `ChileThemes.private`
- `ChileThemes.taxi`
- `ChileThemes.collectiveTaxi`
- `ChileThemes.radiotaxi`
- `ChileThemes.bus`
- `ChileThemes.freeZone`
- `ChileThemes.trailer`
- `ChileThemes.lightTrailer`
- `ChileThemes.diplomatic`
- `ChileThemes.police`
- `ChileThemes.provisional`

## Change it

`PlateCanvas` takes `spec:` (an entry of `ChilePlates`) and `theme:` (an entry of `ChileThemes`). Set `validator:` to `ChileValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `ChileCountry` — the country panel.
- `ChileValidator` — the plate validator.
- `ChileMissions` — code table.

## Plates

The Chilean plates. `private` is `BB·BB▪10` (groups `first`, `second`,
`number`); the taxi, radiotaxi, free-zone and bus plates are the same
layout in other colours, so they reuse its spec's cells. `trailer` is
`JD▪20·67`; `lightTrailer` `BKF $ 125`; `diplomatic` `CD ★ 2401` (groups
`first`, `mission`, `number`); `police` `RP ★ 2560`; `provisional`
`PR ★ 065`. Colour is a theme: see `ChileThemes`.

The two Easter Island provincial plates, `ABC 123`. They share one design;
the caption and the optional district number are parameters, colour lives
on `EasterIslandThemes`. Groups: `letters`, `number`.

Provincial captions were dropped in 1984; these are the older plates the
article pictures.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/chile_plate/blob/main/LICENSE).
