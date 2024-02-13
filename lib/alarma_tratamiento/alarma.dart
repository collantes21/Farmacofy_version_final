// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class AlarmaProvider extends ChangeNotifier {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   bool _isAlarmActivated = false;

//   bool get isAlarmActivated => _isAlarmActivated;

//   void toggleAlarm(bool value) {
//     _isAlarmActivated = value;
//     notifyListeners();
//   }

//   Future<void> scheduleNotification(
//       String title, String body, DateTime scheduleDateTime) async {
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//       ongoing: true, // Mantener la notificación visible
//     );

//     var platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0, // ID de la notificación
//       title,
//       body,
//       tz.TZDateTime.from(scheduleDateTime, tz.local),
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   // Método para verificar si se debe activar la alarma
//   Future<void> checkAlarmCondition() async {
//     // Lógica para verificar si se cumple la condición para activar la alarma
//     // Aquí debes implementar tu propia lógica
//     if (/* condición para activar la alarma */) {
//       toggleAlarm(true);
//       // Obtener la fecha y hora para programar la alarma
//       DateTime alarmDateTime = DateTime.now().add(Duration(seconds: 10));
//       await scheduleNotification(
//         'Título de la alarma',
//         'Cuerpo de la alarma',
//         alarmDateTime,
//       );
//     }
//   }
// }
