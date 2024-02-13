import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

//en este archivo se encuentran las funciones para inicializar las notificaciones, mostrarlas y llamar a emergencias


//creamos un objeto de notificaciones
final FlutterLocalNotificationsPlugin flutterNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


//funcion para inicializar las notificaciones
Future<void> initNotifications() async {
  
  //Constantes de inicializacion
  
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  //en android se usa el icono app_icon que se encuentra en la carpeta drawable(app/src/res), si no lo
  //tenemos copiamos el icono de la carpeta mipmap y cambiamos el nombre a app_icon

  
  //en ios toma el icono por defecto
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();


  //crear un objeto de inicializacion de notificaciones
  const InitializationSettings initializationSettings =
      InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
  
  await flutterNotificationsPlugin.initialize(initializationSettings);
}

//funcion para mostrar una notificacion


Future<void> mostrarNotification(String title, String body) async {
  //creamos un objeto de configuracion de la notificacion
  const AndroidNotificationDetails androidNotificacion =
      AndroidNotificationDetails(
          'canal_id', 'Emergencia', 
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
          ongoing: true, //mantener la notificacion visible
          );
  
  //creamos el objeto de notificacion
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificacion);


  //mostramos la notificacion
  await flutterNotificationsPlugin.show(
      0, title, body, notificationDetails,payload: 'item x');
 }

// Función para mostrar una notificación con botones de acción
Future<void> mostrarNotificationConBotones(String title, String body) async {
  // Crear un canal de notificación para Android
   const AndroidNotificationDetails androidNotification = AndroidNotificationDetails(
    'canal_id', 'Emergencia', 
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
    ongoing: true,
    // Configurar los botones de acción sin iconos
    actions: [
      AndroidNotificationAction('tomar', 'Tomar'),
      AndroidNotificationAction('posponer', 'Posponer'),
    ],
  );
  
  // Crear el objeto de notificación
  const NotificationDetails notificationDetails = NotificationDetails(android: androidNotification);

  // Mostrar la notificación
  await flutterNotificationsPlugin.show(0, title, body, notificationDetails, payload: 'item x');
}


//funcion para llamar a emergencias
Future<void> llamaEmergencias() async {
  // const String numeroEmergencias = 'tel:112';
  UrlLauncher.launch("tel://112");
  // if(await canLaunchUrlString(numeroEmergencias)){
  //   await launchUrlString(numeroEmergencias);
  // }
  // else{
  //   throw 'No se pudo llamar a $numeroEmergencias';
  // }
}