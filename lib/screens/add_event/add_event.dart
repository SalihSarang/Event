import 'package:event_vault/costum_widgets/catogory_dropdown.dart';
import 'package:flutter/material.dart';

class ScreenAddEvent extends StatefulWidget {
  const ScreenAddEvent({super.key});

  @override
  State<ScreenAddEvent> createState() => _ScreenAddEventState();
}

class _ScreenAddEventState extends State<ScreenAddEvent> {
  List<String> addEventList = ['Party', 'Catering', 'Decoration'];
  String starting = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          dropDown(
            addEventList,
            starting,
            (String? value) {
              setState(() {
                starting = value!;
              });
            },
          )
        ],
      )),
    );
  }
}
