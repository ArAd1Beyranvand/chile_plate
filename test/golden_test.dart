import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chile_plate/chile_plate.dart';
import 'package:plate_core/plate_core.dart';

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

  /// category id -> (spec, theme, space-separated sample value)
  final Map<String, (PlateSpec, PlateTheme, String)>
  cases = <String, (PlateSpec, PlateTheme, String)>{
    'private': (ChilePlates.private, ChileThemes.private, 'BB BB 10'),
    'taxi': (ChilePlates.private, ChileThemes.taxi, 'BP CW 17'),
    'collective_taxi': (
      ChilePlates.private,
      ChileThemes.collectiveTaxi,
      'CD JL 70',
    ),
    'radiotaxi': (ChilePlates.private, ChileThemes.radiotaxi, 'CT YS 61'),
    'free_zone': (ChilePlates.private, ChileThemes.freeZone, 'DZ GF 45'),
    'bus': (ChilePlates.bus, ChileThemes.bus, 'DH RJ 52'),
    'trailer': (ChilePlates.trailer, ChileThemes.trailer, 'JD 20 67'),
    'light_trailer': (
      ChilePlates.lightTrailer,
      ChileThemes.lightTrailer,
      'BKF 125',
    ),
    'diplomatic': (ChilePlates.diplomatic, ChileThemes.diplomatic, 'CD 24 01'),
    'police': (ChilePlates.police, ChileThemes.police, 'RP 2560'),
    'provisional': (ChilePlates.provisional, ChileThemes.provisional, 'PR 045'),
  };

  for (final MapEntry<String, (PlateSpec, PlateTheme, String)> c
      in cases.entries) {
    testWidgets(c.key, (tester) async {
      final (PlateSpec spec, PlateTheme theme, String values) = c.value;
      final PlateController controller = PlateController.fromValues(
        spec,
        values.split(' '),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 680,
                height: 300,
                child: PlateThemeScope(
                  theme: theme,
                  child: PlateView(
                    controller: controller,
                    theme: theme,
                    country: ChileCountry.chile,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/cl_${c.key}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
