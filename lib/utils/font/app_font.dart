import 'dart:ui';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle myFont({double? size}) {
  final myFontTheme = GoogleFonts.roboto(
    color: AppTheme.textW,
    fontWeight: FontWeight.w800,
    fontSize: size,
  );
  return myFontTheme;
}

TextStyle hintFont({double? size}) {
  final myFontTheme = GoogleFonts.roboto(
    color: AppTheme.hint,
    fontWeight: FontWeight.w800,
    fontSize: size,
  );
  return myFontTheme;
}

TextStyle myFontColor({double? size, Color? color}) {
  final myFontTheme = GoogleFonts.roboto(
    color: color ?? AppTheme.textW,
    fontWeight: FontWeight.w800,
    fontSize: size,
  );
  return myFontTheme;
}

TextStyle appNamefont({double? size, Color? color}) {
  final myFontTheme = GoogleFonts.roboto(
    color: color ?? AppTheme.textW,
    fontWeight: FontWeight.w900,
    fontSize: size,
  );
  return myFontTheme;
}
