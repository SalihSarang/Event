import 'package:event_vault/widgets/app_theme/app_theme.dart';
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
            color: AppTheme.textW,
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: AppTheme.mainBg,
      iconTheme: const IconThemeData(color: AppTheme.textW),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
