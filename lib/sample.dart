// import 'package:flutter/material.dart';

// class TimePickerExample extends StatefulWidget {
//   @override
//   _TimePickerExampleState createState() => _TimePickerExampleState();
// }

// class _TimePickerExampleState extends State<TimePickerExample> {
//   TimeOfDay _selectedTime = TimeOfDay(hour: 12, minute: 0); // default time
//   String _timeString = ''; // Variable to store time as String

//   // Function to open the time picker
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime, // initial selected time
//     );
//     if (picked != null && picked != _selectedTime) {
//       setState(() {
//         _selectedTime = picked;
//         _timeString = _selectedTime.format(context); // Convert TimeOfDay to String
//       });
//     }
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
//             Text(
//               'Selected Time: $_timeString', // Display time as a string
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _selectTime(context),
//               child: Text('Select Time'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: TimePickerExample(),
//   ));
// }
