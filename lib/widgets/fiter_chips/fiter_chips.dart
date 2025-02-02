import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuChip extends StatefulWidget {
  List<String> chipItems;
  String manuTitle;
  MenuChip({super.key, required this.chipItems, required this.manuTitle});

  @override
  _MenuChipState createState() => _MenuChipState();
}

var chipList = [];

class _MenuChipState extends State<MenuChip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.manuTitle,
            style: GoogleFonts.roboto(
              color: ColorPalette.textW,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: widget.chipItems.map(
              (filterType) {
                return FilterChip(
                  selectedColor: ColorPalette.hilite,
                  backgroundColor: ColorPalette.secondary,
                  checkmarkColor: ColorPalette.textW,
                  label: Text(
                    filterType,
                    style: GoogleFonts.roboto(
                      color: ColorPalette.textW,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  selected: chipList.contains(filterType),
                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        chipList.add(filterType);
                      } else {
                        chipList.removeWhere(
                          (name) {
                            return name == filterType;
                          },
                        );
                      }
                    });
                  },
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
