import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chile_plate/chile_plate.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';

/// One golden per category, drawn with real bold faces so the ink can be
/// measured against the references (`platekit golden-check`).
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  setUpAll(() async {
    final FontLoader loader = FontLoader('Roboto');
    for (final String path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ]) {
      final File face = File(path);
      if (!face.existsSync()) continue;
      loader.addFont(face.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  /// category id -> (spec, theme, sample value: one space-separated token
  /// per slot, i.e. per field — `'AB 1234'`, never `'A B 1 2 3 4'`)
  final Map<String, (PlateSpec, PlateTheme, String)> cases =
      <String, (PlateSpec, PlateTheme, String)>{
        'easter_island': (
          EasterIslandPlates.easterIsland,
          EasterIslandThemes.easterIsland,
          'FZU 026',
        ),
        'juan_fernandez': (
          EasterIslandPlates.juanFernandez,
          EasterIslandThemes.juanFernandez,
          'FPA 094',
        ),
      };

  for (final MapEntry<String, (PlateSpec, PlateTheme, String)> c
      in cases.entries) {
    testWidgets(c.key, (tester) async {
      final (PlateSpec spec, PlateTheme theme, String values) = c.value;
      final PlateController controller = PlateController.fromValues(
        spec,
        values.split(' '),
      );
      await pumpPlateGolden(
        tester,
        controller,
        'goldens/ea_${c.key}.png',
        theme: theme,
        country: EasterIslandCountry.easter_island,
      );
    });
  }
}
