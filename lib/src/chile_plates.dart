import 'package:flutter/widgets.dart' show EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'chile_country.dart';
import 'chile_missions.dart';

/// One group of evenly pitched cells: [count] cells of the [alphabet] centred
/// on [cx] at [pitch].
class _Run {
  const _Run(this.key, this.alphabet, this.count, this.cx, this.pitch);

  final String key;
  final PlateAlphabet alphabet;
  final int count;
  final double cx, pitch;
}

/// A fixed word or sign centred on ([cx], [cy]) in a box [width] wide.
class _Mark {
  const _Mark(this.text, this.cx, this.cy, this.width, this.glyph);

  final String text;
  final double cx, cy, width, glyph;
}

/// A separator drawn as a short rule: a dot or the shield block.
class _Sep {
  const _Sep(this.cx, this.cy, this.width, this.height);

  final double cx, cy, width, height;
}

/// What one design shares: the cells, the separators and the fixed text.
/// Colours are not here; they live on `ChileThemes`.
class _Design {
  const _Design({
    required this.id,
    required this.runs,
    this.marks = const <_Mark>[],
    this.seps = const <_Sep>[],
    this.rowTop = 0,
    this.rowHeight = _Layout.rowHeight,
    this.restrictions = const <PlateRestriction>[],
  });

  final String id;
  final List<_Run> runs;
  final List<_Mark> marks;
  final List<_Sep> seps;
  final double rowTop, rowHeight;
  final List<PlateRestriction> restrictions;
}

/// Where the ink sits, in plate units.
///
/// Every plate is 360×130 (article). The geometry is read off the vector
/// overview of the categories (`overview.png`, plates ~145×53 px, scaled by
/// 2.48) by projecting the ink onto each axis; the provisional plate's digits
/// and the first design's cells were cross-checked on the photographs
/// (`1985_DT_RC_78_particular`, `2013_PR_065_provisoria`), which agree to
/// ~2 units. Numbers below are plate units.
///
/// Two-pair plates (private, taxis, bus, free zone, trailer): cells centred
/// 36.0 and 84.5 (pitch 47.2), 157.7 and 204.8, then the digits 280 and 327;
/// ink y 12.3–83.4 (taxi 12.3–80.9), caption y 100.6–117.7 centred 109.1.
/// Between the first and second pair a dot (x 114–124, ~9 wide) and before the
/// digits a shield block (x 233.4–253.2, ~20 wide, centred y ~46); the trailer
/// swaps them. The bus plate's `TRANSANTIAGO` spans x 74.5–285.5.
///
/// Light trailer: red on white, region caption y 12.3–29.4 (`ANTOFAGASTA` x
/// 79.4–283), body ink y 46.6–117.7; letters centred 37.3, 86.9, 136.5, a `$`
/// x 171.3–193.7, digits 231, 278, 324.
///
/// Diplomatic: letters as above, a star x 129–141.5, then four digits at
/// 186, 231, 278, 323 (mission pair, serial pair); ink y 14.7–83.4.
///
/// Police: caption `CARABINEROS DE CHILE` x 37.2–322.8, y 14.2–33.1; body y
/// 49.6–115.8, letters as above, a star x 129–144, digits 186, 232, 278, 324.
///
/// Provisional: P 22.3–62.1, R 69.5–109.2 (centres 42.2, 89.4), a star x
/// 151.4–166.3, digits 226, 272, 318; ink y 12.3–80.9; `PROVISORIA 2014`
/// x 54.6–305.4, y 98.1–117.7.
///
/// Ink is about 55% of a box, and a box cannot leave the canvas, so a 96-tall
/// row gives ink ~53 against the reference's 71 (about 74%); the lower body of
/// the light trailer and the police plate sits in a 94-tall box. Captions meet
/// their 17–19 of ink with a glyph of 30–34 in a short box. Caption
/// letter-spacing is typed spaces on `CHILE` only; the others are tighter than
/// the reference. Dots and shields are square rules (the engine's rule is a
/// rectangle) and the arms inside the shield is not drawn.
///
/// Not drawn: the motorcycle plate, the army (`EJTO`), fire brigade, the
/// single-letter police series (`Z 4156` needs one cell, not two), the
/// four-digit provisional serial, and the 1985 AA·10·00 series. The
/// diplomatic series carries the Israel mission code 39 as a
/// [PlateRestriction], so it cannot be stored.
abstract final class _Layout {
  static const double width = 360;
  static const double height = 130;
  static const double rowHeight = 96;

  static const _Mark chile = _Mark('C H I L E', 178.5, 109.1, 140, 31);

  static const _Run first = _Run(
    'first',
    ChileAlphabets.letters,
    2,
    60.5,
    47.2,
  );
  static const _Run secondLetters = _Run(
    'second',
    ChileAlphabets.letters,
    2,
    181.2,
    47.1,
  );
  static const _Run secondDigits = _Run(
    'second',
    PlateAlphabet.latinDigits,
    2,
    181.2,
    47.1,
  );
  static const _Run number = _Run(
    'number',
    PlateAlphabet.latinDigits,
    2,
    303.5,
    47.2,
  );

  static const _Sep dot = _Sep(119, 46, 9, 9);
  static const _Sep shield = _Sep(243.3, 46, 19.8, 19.8);
  static const _Sep trailerShield = _Sep(118.5, 46, 19.8, 19.8);
  static const _Sep trailerDot = _Sep(243.3, 46, 9, 9);

  static const _Design twoPair = _Design(
    id: 'cl.private',
    runs: <_Run>[first, secondLetters, number],
    marks: <_Mark>[chile],
    seps: <_Sep>[dot, shield],
  );

  static const _Design bus = _Design(
    id: 'cl.bus',
    runs: <_Run>[first, secondLetters, number],
    marks: <_Mark>[_Mark('TRANSANTIAGO', 180, 109.1, 230, 33)],
    seps: <_Sep>[dot, shield],
  );

  static const _Design trailer = _Design(
    id: 'cl.trailer',
    runs: <_Run>[
      _Run('first', ChileAlphabets.anyLetters, 2, 60.5, 47.2),
      secondDigits,
      number,
    ],
    marks: <_Mark>[chile],
    seps: <_Sep>[trailerShield, trailerDot],
  );

  static _Design lightTrailer(String region) => _Design(
    id: 'cl.trailer.light',
    runs: const <_Run>[
      _Run('first', ChileAlphabets.letters, 3, 86.9, 49.6),
      _Run('number', PlateAlphabet.latinDigits, 3, 278, 46.5),
    ],
    marks: <_Mark>[
      _Mark(region, 181, 20.9, 230, 31),
      const _Mark(r'$', 182.5, 82, 30, 60),
    ],
    rowTop: 35,
    rowHeight: 94,
  );

  static const _Design diplomatic = _Design(
    id: 'cl.diplomatic',
    runs: <_Run>[
      _Run('first', ChileAlphabets.diplomaticLetters, 2, 60.5, 47.2),
      _Run('mission', PlateAlphabet.latinDigits, 2, 209, 45.6),
      _Run('number', PlateAlphabet.latinDigits, 2, 300.2, 45.6),
    ],
    marks: <_Mark>[chile, _Mark('★', 135.3, 47, 30, 22)],
    restrictions: <PlateRestriction>[ChileMissions.restriction],
  );

  static const _Design police = _Design(
    id: 'cl.police',
    runs: <_Run>[
      _Run('first', ChileAlphabets.anyLetters, 2, 60.5, 47.2),
      _Run('number', PlateAlphabet.latinDigits, 4, 255, 46),
    ],
    marks: <_Mark>[
      _Mark('CARABINEROS DE CHILE', 180, 23.7, 300, 30),
      _Mark('★', 136.5, 82, 30, 26),
    ],
    rowTop: 35,
    rowHeight: 94,
  );

  static const _Design provisional = _Design(
    id: 'cl.provisional',
    runs: <_Run>[
      _Run('first', ChileAlphabets.anyLetters, 2, 65.8, 47.2),
      _Run('number', PlateAlphabet.latinDigits, 3, 272, 46),
    ],
    marks: <_Mark>[
      _Mark('PROVISORIA 2014', 180, 107.9, 270, 34),
      _Mark('★', 158.8, 46.6, 30, 26),
    ],
  );
}

/// The Chilean plates. [private] is `BB·BB▪10` (groups `first`, `second`,
/// `number`); the taxi, radiotaxi, free-zone and bus plates are the same
/// layout in other colours, so they reuse its spec's cells. [trailer] is
/// `JD▪20·67`; [lightTrailer] `BKF $ 125`; [diplomatic] `CD ★ 2401` (groups
/// `first`, `mission`, `number`); [police] `RP ★ 2560`; [provisional]
/// `PR ★ 065`. Colour is a theme: see `ChileThemes`.
abstract final class ChilePlates {
  static final PlateSpec private = _spec(_Layout.twoPair);

  /// Taxi, radiotaxi and free-zone plates share [private]'s layout; only the
  /// theme differs.
  static final PlateSpec taxi = _spec(_Layout.twoPair, id: 'cl.taxi');
  static final PlateSpec collectiveTaxi = _spec(
    _Layout.twoPair,
    id: 'cl.taxi.collective',
  );
  static final PlateSpec radiotaxi = _spec(
    _Layout.twoPair,
    id: 'cl.taxi.radio',
  );
  static final PlateSpec freeZone = _spec(_Layout.twoPair, id: 'cl.freezone');
  static final PlateSpec bus = _spec(_Layout.bus);
  static final PlateSpec trailer = _spec(_Layout.trailer);
  static final PlateSpec lightTrailer = lightTrailerFor('ANTOFAGASTA');
  static final PlateSpec diplomatic = _spec(_Layout.diplomatic);
  static final PlateSpec police = _spec(_Layout.police);
  static final PlateSpec provisional = _spec(_Layout.provisional);

  /// The light trailer plate with its own region captioned above the number.
  static PlateSpec lightTrailerFor(String region) =>
      _spec(_Layout.lightTrailer(region));

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    taxi,
    collectiveTaxi,
    radiotaxi,
    freeZone,
    bus,
    trailer,
    lightTrailer,
    diplomatic,
    police,
    provisional,
  ];

  static PlateSpec _spec(_Design d, {String? id}) {
    final List<PlateSlot> slots = <PlateSlot>[];
    final List<PlateTextGroup> groups = <PlateTextGroup>[];
    for (final _Run r in d.runs) {
      groups.add(
        PlateTextGroup(<int>[
          for (int i = 0; i < r.count; i++) slots.length + i,
        ], key: r.key),
      );
      slots.addAll(
        plateRegister(
          alphabet: r.alphabet,
          count: r.count,
          left: r.cx - r.count * r.pitch / 2,
          top: d.rowTop,
          width: r.pitch,
          height: d.rowHeight,
        ),
      );
    }
    return PlateSpec(
      id: id ?? d.id,
      country: ChileCountry.chile,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(
        box: PlateBox(0, 0, 0, _Layout.height),
        padding: EdgeInsets.zero,
      ),
      rules: <PlateRule>[
        for (final _Sep s in d.seps)
          PlateRule(
            box: PlateBox(
              s.cx - s.width / 2,
              s.cy - s.height / 2,
              s.width,
              s.height,
            ),
          ),
      ],
      slots: slots,
      labels: <PlateLabel>[
        for (final _Mark m in d.marks)
          PlateLabel(
            text: m.text,
            box: PlateBox(m.cx - m.width / 2, m.cy - 11, m.width, 22),
            glyphHeight: m.glyph,
          ),
      ],
      textGroups: groups,
      restrictions: d.restrictions,
    );
  }
}
