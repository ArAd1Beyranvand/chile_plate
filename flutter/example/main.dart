import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:chile_plate/chile_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: ChilePlates.private, theme: ChileThemes.private),
);
