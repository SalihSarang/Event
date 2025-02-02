import 'dart:ui';

import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle myFont({double? size}) {
  final myFontTheme = GoogleFonts.roboto(
    color: ColorPalette.textW,
    fontWeight: FontWeight.w800,
    fontSize: size,
  );
  return myFontTheme;
}
