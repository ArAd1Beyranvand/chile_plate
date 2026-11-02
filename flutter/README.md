FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Chile to view examples:

https://platexample.ir/#/discover/chile

# chile_plate

Chile's licence plates for the `plate_core` library: the private, taxi, bus, free-zone, trailer, diplomatic, police and provisional plates, each in its own colours, with an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  chile_plate: ^0.1.0
```

## Use

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

## Contains

- `ChileCountry` — country panel: `chile`.
- `EasterIslandCountry` — country panel: `easter_island`.
- `ChilePlates` — 8 plate specs: `private`, `bus`, `trailer`, `lightTrailer`, `diplomatic`, `police`, `provisional`, `lightTrailerFor()`.
- `EasterIslandPlates` — 2 plate specs: `easterIsland`, `juanFernandez`.
- `ChileThemes` — 11 themes: `private`, `taxi`, `collectiveTaxi`, `radiotaxi`, `bus`, `freeZone`, `trailer`, `lightTrailer`, `diplomatic`, `police` and 1 more.
- `EasterIslandThemes` — 2 themes: `easterIsland`, `juanFernandez`.
- `ChileValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `EasterIslandValidator` — advisory validator; flags the frame, never blocks a keystroke.
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

