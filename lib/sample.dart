// // import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
// // import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';

// // ValueNotifier<List<CatogoryModel>> listenCategory = ValueNotifier([]);

// // sample() async {
// //   await Hive.openBox<CatogoryModel>(CATEGORY);
// //   var categoryBox = Hive.box<CatogoryModel>(CATEGORY);
// //   listenCategory.value.addAll(categoryBox.values);
// // }
// import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CupertinoTimePickerExample extends StatefulWidget {
//   @override
//   _CupertinoTimePickerExampleState createState() =>
//       _CupertinoTimePickerExampleState();
// }

// class _CupertinoTimePickerExampleState
//     extends State<CupertinoTimePickerExample> {
//   TimeOfDay _selectedTime = TimeOfDay.now();

//   void _showTimePicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext builder) {
//         return Container(
//           height: 250,
//           color: Colors.white,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: CupertinoDatePicker(
//                   mode: CupertinoDatePickerMode.time,
//                   initialDateTime: DateTime(
//                     2000,
//                     1,
//                     1,
//                     _selectedTime.hour,
//                     _selectedTime.minute,
//                   ),
//                   onDateTimeChanged: (DateTime newDateTime) {
//                     setState(() {
//                       _selectedTime = TimeOfDay(
//                         hour: newDateTime.hour,
//                         minute: newDateTime.minute,
//                       );
//                     });
//                   },
//                   use24hFormat: false, // Set to true for 24-hour clock
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context), // Close the picker
//                 child: Text('Done'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Time Picker Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display the selected time
//             Text(
//               'Selected Time: ${_selectedTime.format(context)}',
//               style: TextStyle(fontSize: 30, color: ColorPalette.textW),
//             ),
//             SizedBox(height: 20),
//             // Button to show the time picker
//             ElevatedButton(
//               onPressed: () => _showTimePicker(context),
//               child: Text('Pick Time'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: CupertinoTimePickerExample(),
//   ));
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void showTimePicker({required BuildContext context,required TimeOfDay selectedTime}) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext builder) {
//         return Container(
//           height: 500,
//           color: Colors.white,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 400,
//                 child: CupertinoDatePicker(
//                   mode: CupertinoDatePickerMode.time,
//                   initialDateTime: DateTime(
//                     2000,
//                     1,
//                     1,
//                     selectedTime.hour,
//                     selectedTime.minute,
//                   ),
//                   onDateTimeChanged: (DateTime newDateTime) {
//                     setState(() {
//                       selectedTime = TimeOfDay(
//                         hour: newDateTime.hour,
//                         minute: newDateTime.minute,
//                       );
//                     });
//                   },
//                   use24hFormat: false, // Set to true for 24-hour clock
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context), // Close the picker
//                 child: Text('Done'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeSelected;
  const CustomTimePicker({
    Key? key,
    required this.initialTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime(
                2000,
                1,
                1,
                selectedTime.hour,
                selectedTime.minute,
              ),
              onDateTimeChanged: (DateTime newDateTime) {
                setState(() {
                  selectedTime = TimeOfDay(
                    hour: newDateTime.hour,
                    minute: newDateTime.minute,
                  );
                });
              },
              use24hFormat: false, // Set to true for 24-hour clock
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onTimeSelected(selectedTime); // Pass the selected time
              Navigator.pop(context); // Close the picker
            },
            child: Text('Done'),
          ),
        ],
      ),
    );
  }
}
