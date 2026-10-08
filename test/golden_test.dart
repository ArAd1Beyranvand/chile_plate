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
  final Map<String, (PlateSpec, PlateTheme, String)> cases =
      <String, (PlateSpec, PlateTheme, String)>{
        'private': (ChilePlates.private, ChileThemes.private, 'B B B B 1 0'),
    'taxi': (ChilePlates.taxi, ChileThemes.taxi, 'B P C W 1 7'),
    'collective_taxi': (
      ChilePlates.collectiveTaxi,
      ChileThemes.collectiveTaxi,
      'C D J L 7 0',
    ),
    'radiotaxi': (ChilePlates.radiotaxi, ChileThemes.radiotaxi, 'C T Y S 6 1'),
    'free_zone': (ChilePlates.freeZone, ChileThemes.freeZone, 'D Z G F 4 5'),
    'bus': (ChilePlates.bus, ChileThemes.bus, 'D H R J 5 2'),
    'trailer': (ChilePlates.trailer, ChileThemes.trailer, 'J D 2 0 6 7'),
    'light_trailer': (
      ChilePlates.lightTrailer,
      ChileThemes.lightTrailer,
      'B K F 1 2 5',
    ),
    'diplomatic': (
      ChilePlates.diplomatic,
      ChileThemes.diplomatic,
      'C D 2 4 0 1',
    ),
    'police': (ChilePlates.police, ChileThemes.police, 'R P 2 5 6 0'),
    'provisional': (
      ChilePlates.provisional,
      ChileThemes.provisional,
      'P R 0 4 5',
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
