import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          title,
          style: GoogleFonts.roboto(
            color: ColorPalette.textW,
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: ColorPalette.mainBg,
      iconTheme: const IconThemeData(color: ColorPalette.textW),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
