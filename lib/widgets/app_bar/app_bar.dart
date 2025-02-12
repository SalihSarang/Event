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
      bottom: TabBar(
        indicatorWeight: 4.0,
        indicatorPadding: EdgeInsets.symmetric(horizontal: -20),
        labelStyle: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255), fontSize: 25),
        unselectedLabelStyle: TextStyle(color: AppTheme.textW, fontSize: 20),
        tabs: [
          Tab(text: 'Completed Event'),
          Tab(text: 'Pending Events'),
        ],
        indicator: BoxDecoration(
          color: AppTheme.secondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              // color: AppTheme.delete,
              spreadRadius: 3,
              blurRadius: 6,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);
}
