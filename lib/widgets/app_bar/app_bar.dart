import 'package:event_vault/utils/font/app_font.dart';
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

class CustomAppBarHistory extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomAppBarHistory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: myFont(size: 25)),
      centerTitle: true,
      backgroundColor: AppTheme.mainBg,
      iconTheme: const IconThemeData(color: AppTheme.textW),
      automaticallyImplyLeading: false,
      bottom: const TabBar(
        labelStyle: TextStyle(color: AppTheme.hilite, fontSize: 25),
        unselectedLabelStyle: TextStyle(color: AppTheme.textW, fontSize: 20),
        tabs: [
          Tab(text: 'Completed Event'),
          Tab(text: 'Pending Events'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);
}
