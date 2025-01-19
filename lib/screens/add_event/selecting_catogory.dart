import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/screens/add_event/add_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectingCatogory extends StatelessWidget {
  const SelectingCatogory({super.key});

  @override
  Widget build(BuildContext context) {
    const String party = "Party";
    const String catering = "Catering";
    const String decoration = "Decoration";

    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Select Catogory',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            selectCatogory(
              titleBtn: party,
              onBtn: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenAddEvent(
                    selectedCatogory: party,
                  ),
                ));
              },
            ),
            SizedBox(
              height: 10,
            ),
            selectCatogory(
              titleBtn: catering,
              onBtn: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenAddEvent(
                    selectedCatogory: catering,
                  ),
                ));
              },
            ),
            SizedBox(
              height: 10,
            ),
            selectCatogory(
              titleBtn: decoration,
              onBtn: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenAddEvent(
                    selectedCatogory: decoration,
                  ),
                ));
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
