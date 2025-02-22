// import 'dart:developer';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:permission_handler/permission_handler.dart';

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     tz.initializeTimeZones();

//     // Request notification permissions
//     if (await Permission.notification.isDenied) {
//       await Permission.notification.request();
//     }

//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings settings = InitializationSettings(
//       android: androidSettings,
//     );

//     await _notificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//     );

//     log('Notification service initialized');
//   }

//   static Future<void> scheduleNotification({
//     required int id,
//     required String title,
//     required String body,
//     required DateTime scheduledTime,
//   }) async {
//     int validId = id % (1 << 31);
//     final tz.TZDateTime scheduledTZTime =
//         tz.TZDateTime.from(scheduledTime, tz.local);

//     log('Scheduling notification ID: $validId at $scheduledTZTime');

//     try {
//       await _notificationsPlugin.zonedSchedule(
//         validId,
//         title,
//         body,
//         scheduledTZTime,
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'event_vault_channel',
//             'Event Vault Notifications',
//             channelDescription: 'Notifications for event reminders',
//             importance: Importance.high,
//             priority: Priority.high,
//             playSound: true,
//             enableVibration: true,
//           ),
//         ),
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//       );

//       log('Notification successfully scheduled for: $title at $scheduledTZTime');
//     } catch (e) {
//       log('Error scheduling notification: $e');
//     }
//   }

//   static void cancelNotification(int id) {
//     int validId = id % (1 << 31);
//     _notificationsPlugin.cancel(validId);
//     log('Notification canceled with ID: $validId');
//   }

//   static void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) {
//     log('Notification received: ${notificationResponse.id}');
//   }

//   static Future<void> showInstantNotification() async {
//     await _notificationsPlugin.show(
//       0,
//       'Test Notification',
//       'This is an immediate notification.',
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'event_vault_channel',
//           'Event Vault Notifications',
//           channelDescription: 'Notifications for event reminders',
//           importance: Importance.high,
//           priority: Priority.high,
//         ),
//       ),
//     );
//     log('Instant notification shown.');
//   }
// }
