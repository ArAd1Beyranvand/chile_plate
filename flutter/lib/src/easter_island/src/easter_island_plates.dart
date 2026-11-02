import 'package:flutter/widgets.dart' show EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'easter_island_country.dart';

/// Where the ink sits, in plate units.
///
/// The canvas is 520×259: the infobox gives 520×110, which contradicts the
/// reference photos (aspect 2.01), so the width is kept and the height follows
/// the photos. Numbers are read off the flattened references
/// (`flat_License_plate_Chile_*`), by projecting ink onto each axis.
///
/// Easter Island: caption `I. DE PASCUA` ink y 18–49.2, x 99–409.2; body ink
/// y 92.8–216.2, letters x 29.8–233.8 (pitch 68), digits x 302–499 (pitch
/// 65.7), a `$` mark between them (x ~258–288, y ~128–185). Juan Fernández:
/// same body; caption `J. FERNANDEZ` x ~116–384 and a district `82` at x
/// ~446–480 (read off the original, as the flattened crop cuts the top off).
///
/// Ink is about 55% of a box, and a 123-unit ink row would need a ~225-unit
/// box on a 259-unit plate; the letters would also be scaled down to fit their
/// box. A 160-unit row gives ink ~85 (about 70% of the reference), at the
/// width the three-character box allows.
abstract final class _Layout {
  static const double width = 520;
  static const double height = 259;
  static const double rowTop = 74.5;
  static const double rowHeight = 160;

  static const PlateBox letters = PlateBox(29.8, rowTop, 204, rowHeight);
  static const PlateBox digits = PlateBox(302, rowTop, 197, rowHeight);

  static const double captionCy = 33.6;
  static const double captionGlyph = 44;
  static const double mark = 80;
}

/// The two Easter Island provincial plates, `ABC 123`. They share one design;
/// the caption and the optional district number are parameters, colour lives
/// on `EasterIslandThemes`. Groups: `letters`, `number`.
///
/// Provincial captions were dropped in 1984; these are the older plates the
/// article pictures.
abstract final class EasterIslandPlates {
  static final PlateSpec easterIsland = _spec(
    'ea.easter_island',
    'I. DE PASCUA',
  );
  static final PlateSpec juanFernandez = _spec(
    'ea.juan_fernandez',
    'J. FERNANDEZ',
    captionCx: 250,
    district: '82',
  );

  static List<PlateSpec> get all => <PlateSpec>[easterIsland, juanFernandez];

  static PlateSpec _spec(
    String id,
    String caption, {
    double captionCx = 254.1,
    String? district,
  }) {
    return PlateSpec(
      id: id,
      country: EasterIslandCountry.easter_island,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(
        box: PlateBox(0, 0, 0, _Layout.height),
        padding: EdgeInsets.zero,
      ),
      slots: <PlateSlot>[
        PlateSlot(
          alphabet: EasterIslandAlphabets.letters,
          box: _Layout.letters,
          length: 3,
        ),
        PlateSlot(
          alphabet: EasterIslandAlphabets.digits,
          box: _Layout.digits,
          length: 3,
        ),
      ],
      labels: <PlateLabel>[
        PlateLabel(
          text: caption,
          box: PlateBox(captionCx - 150, _Layout.captionCy - 14, 300, 28),
          glyphHeight: _Layout.captionGlyph,
        ),
        if (district != null)
          PlateLabel(
            text: district,
            box: const PlateBox(443, _Layout.captionCy - 14, 40, 28),
            glyphHeight: _Layout.captionGlyph,
          ),
        const PlateLabel(
          text: r'$',
          box: PlateBox(243, 126, 60, 60),
          glyphHeight: _Layout.mark,
        ),
      ],
      textGroups: const <PlateTextGroup>[
        PlateTextGroup(<int>[0], key: 'letters'),
        PlateTextGroup(<int>[1], key: 'number'),
      ],
    );
  }
}
