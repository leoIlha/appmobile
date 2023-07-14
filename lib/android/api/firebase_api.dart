// import 'package:firebase_messaging/firebase_messaging.dart';
//
// Future<void>handleBackgoundMessage(RemoteMessage message)async{
//   print('Title:${message.notification?.title}');
//   print('Body:${message.notification?.body}');
//   print('Payload:${message.data}');
// }
//
// class FirebaseApi{
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> initNotifications()async{
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token:$fCMToken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgoundMessage);
//   }
// }




// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// // Crie uma instância do FlutterLocalNotificationsPlugin
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// // Função para agendar uma notificação com base em uma tarefa
// void agendarNotificacao(Tarefa tarefa) async {
//   // Obtenha a data e hora da tarefa
//   DateTime dataHoraTarefa = DateTime.parse(tarefa.dataHora);
//
//   // Verifique se a data e hora da tarefa são iguais ou anteriores à data e hora atual
//   if (dataHoraTarefa.isBefore(DateTime.now())) {
//     // Crie a configuração da notificação
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       'channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     // Agende a notificação para a data e hora da tarefa
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Lembrete de Tarefa',
//       'Descrição: ${tarefa.descricao}',
//       TZDateTime.from(dataHoraTarefa, local).subtract(const Duration(minutes: 5)),
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }




// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// import '../model/Tarefa.dart';
//
// // Função para lidar com as mensagens em segundo plano
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }
//
// // Classe responsável pela interação com o Firebase Cloud Messaging
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token: $fCMToken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
//   // Criação da instância do FlutterLocalNotificationsPlugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
// // Função para agendar uma notificação com base em uma tarefa
//   void agendarNotificacao(Tarefa tarefa) async {
//     print('TAREFA:'+tarefa.description);
//     print('TAREFA:'+tarefa.dataHora);
//     print('TAREFA:'+tarefa.context);
//     // Obtenção da data e hora da tarefa
//     DateTime dataHoraTarefa = DateTime.parse(tarefa.dataHora);
//
//     // Configuração do TimeZone
//     tz.initializeTimeZones();
//     final location = tz.getLocation('America/Sao_Paulo');
//
//     // Verificação se a data e hora da tarefa são iguais ou anteriores à data e hora atual
//     if (dataHoraTarefa.isBefore(DateTime.now())) {
//       // Criação da configuração da notificação
//
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//         'channel_id',
//         'channel_name',
//         channelDescription:'channel_description',
//         importance: Importance.max,
//         priority: Priority.high,
//         playSound: true,
//         enableLights: true,
//         enableVibration: true,
//       );
//       const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//
//       // Agendamento da notificação para a data e hora da tarefa
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Lembrete de Tarefa',
//         'Descrição: ${tarefa.description}',
//         tz.TZDateTime.from(dataHoraTarefa, location).subtract(const Duration(minutes: 5)),
//         platformChannelSpecifics,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//       );
//     }
//   }
//
// }
//




// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../model/Tarefa.dart';
//
// // Função para lidar com as mensagens em segundo plano
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }
//
// // Classe responsável pela interação com o Firebase Cloud Messaging
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token: $fCMToken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
//
//   // Criação da instância do FlutterLocalNotificationsPlugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   // Função para agendar uma notificação com base em uma tarefa
//   void agendarNotificacao(Tarefa tarefa) async {
//     print('TAREFA:' + tarefa.description);
//     print('TAREFA:' + tarefa.dataHora);
//     print('TAREFA:' + tarefa.context);
//     // Obtenção da data e hora da tarefa
//     DateTime dataHoraTarefa = DateTime.parse(tarefa.dataHora);
//     // Configuração do TimeZone
//     tz.initializeTimeZones();
//     final location = tz.getLocation('America/Sao_Paulo');
//
//     // Verificação se a data e hora da tarefa são iguais ou anteriores à data e hora atual
//     if (dataHoraTarefa.isBefore(DateTime.now())) {
//
//       // Criação da configuração da notificação
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//         'channel_id',
//         'channel_name',
//         channelDescription: 'channel_description',
//         importance: Importance.max,
//         priority: Priority.high,
//         playSound: true,
//         enableLights: true,
//         enableVibration: true,
//       );
//       const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//
//       // Agendamento da notificação para a data e hora da tarefa
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Lembrete de Tarefa',
//         'Descrição: ${tarefa.description}',
//         tz.TZDateTime.from(dataHoraTarefa, location)
//             .subtract(const Duration(minutes: 1)),
//         platformChannelSpecifics,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//       );
//     }
//
//     // Envio da notificação para o Firebase Cloud Messaging
//     await enviarNotificacaoFirebase(tarefa);
//   }
//
//   // Função para enviar a notificação para o Firebase Cloud Messaging
//   Future<void> enviarNotificacaoFirebase(Tarefa tarefa) async {
//     print('firebase:'+tarefa.context);
//     try {
//       // Configuração da URL de envio para o FCM
//       final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
//
//       // Obtenção do token do dispositivo (previamente obtido durante a inicialização do app)
//       final String? token = await FirebaseMessaging.instance.getToken();
//       print('Tokeneeeeeeeeeeeeeeeeee: $token');
//       // Construção do corpo da notificação
//       final body = {
//         'notification': {
//           'title': 'Nova Tarefa',
//           'body': tarefa.description,
//         },
//         'to': token,
//       };
//
//       // Envio da notificação para o FCM
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'key=AAAAyQa66y4:APA91bF8uh5pn8oXX4ihuvfTiL8Ecb2dgyJqPwUGYMxrhj-J49zMrq6Gok0uJO9UPHstvMbh0my_RnhfAF5WaWh4rcR-vx5X5Jg1ndOXMIH852vQ4k7d47zzrbl8C5r43OZx814j8024', // Substitua pela sua Server Key do FCM
//         },
//         body: jsonEncode(body),
//       );
//
//       if (response.statusCode == 200) {
//         print('Notificação enviada com sucesso!');
//       } else {
//         print('Erro ao enviar notificação: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Erro ao enviar notificação: $e');
//     }
//   }
// }

















//partir daqui para baixo

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../model/Tarefa.dart';
//
// // Função para lidar com as mensagens em segundo plano
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }
//
// // Classe responsável pela interação com o Firebase Cloud Messaging
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token: $fCMToken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
//
//   // Criação da instância do FlutterLocalNotificationsPlugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   // Função para agendar uma notificação com base em uma tarefa
//   void agendarNotificacao(Tarefa tarefa) async {
//     print('TAREFA:' + tarefa.description);
//     print('TAREFA:' + tarefa.dataHora);
//     print('TAREFA:' + tarefa.context);
//
//     // Obtenção da data e hora atual
//     DateTime dataHoraAtual = DateTime.now();
//
//     // Obtenção da data e hora da tarefa
//     DateTime dataHoraTarefa = DateTime.parse(tarefa.dataHora);
//
//     // Verificação se a data e hora da tarefa são iguais ou posteriores à data e hora atual
//     if (dataHoraTarefa.isAfter(dataHoraAtual) || dataHoraTarefa.isAtSameMomentAs(dataHoraAtual)) {
//       // As datas são válidas, então podemos agendar a notificação
//
//       // Configuração do TimeZone
//       tz.initializeTimeZones();
//       final location = tz.getLocation('America/Sao_Paulo');
//
//       // Criação da configuração da notificação
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//         'channel_id',
//         'channel_name',
//         channelDescription: 'channel_description',
//         importance: Importance.max,
//         priority: Priority.high,
//         playSound: true,
//         enableLights: true,
//         enableVibration: true,
//         icon: '@drawable/ic_launcher'
//       );
//       const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//
//       // Agendamento da notificação para a data e hora da tarefa
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Lembrete de Tarefa',
//         'Descrição: ${tarefa.description}',
//
//         tz.TZDateTime.from(dataHoraTarefa, location),
//         platformChannelSpecifics,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//       );
//     }
//   }
//
//
//   // Função para enviar a notificação para o Firebase Cloud Messaging
//   Future<void> enviarNotificacaoFirebase(Tarefa tarefa) async {
//     print('firebase:'+tarefa.context);
//     try {
//       // Configuração da URL de envio para o FCM
//       final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
//
//       // Obtenção do token do dispositivo (previamente obtido durante a inicialização do app)
//       final String? token = await FirebaseMessaging.instance.getToken();
//       print('Tokeneeeeeeeeeeeeeeeeee: $token');
//       // Construção do corpo da notificação
//       final body = {
//         'notification': {
//           'title': 'Nova Tarefa',
//           'body': tarefa.description,
//
//         },
//         'to': token,
//       };
//
//       // Envio da notificação para o FCM
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'key=AAAAyQa66y4:APA91bF8uh5pn8oXX4ihuvfTiL8Ecb2dgyJqPwUGYMxrhj-J49zMrq6Gok0uJO9UPHstvMbh0my_RnhfAF5WaWh4rcR-vx5X5Jg1ndOXMIH852vQ4k7d47zzrbl8C5r43OZx814j8024', // Substitua pela sua Server Key do FCM
//         },
//         body: jsonEncode(body),
//       );
//
//       if (response.statusCode == 200) {
//         print('Notificação enviada com sucesso!');
//       } else {
//         print('Erro ao enviar notificação: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Erro ao enviar notificação: $e');
//     }
//   }
// }
//
//






// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../model/Tarefa.dart';
//
// // Função para lidar com as mensagens em segundo plano
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }
//
// // Classe responsável pela interação com o Firebase Cloud Messaging
// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final fCMToken = await _firebaseMessaging.getToken();
//     print('Token: $fCMToken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
//
//   // Criação da instância do FlutterLocalNotificationsPlugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   // Função para agendar uma notificação com base em uma tarefa
//   void agendarNotificacao(Tarefa tarefa) async {
//     print('TAREFA:' + tarefa.description);
//     print('TAREFA:' + tarefa.dataHora);
//     print('TAREFA:' + tarefa.context);
//
//     // Obtenção da data e hora atual
//     DateTime dataHoraAtual = DateTime.now();
//
//     // Obtenção da data e hora da tarefa
//     DateTime dataHoraTarefa = DateTime.parse(tarefa.dataHora);
//
//     // Verificação se a data e hora da tarefa são iguais ou posteriores à data e hora atual
//     if (dataHoraTarefa.isAfter(dataHoraAtual) || dataHoraTarefa.isAtSameMomentAs(dataHoraAtual)) {
//       // As datas são válidas, então podemos agendar a notificação
//
//       // Configuração do TimeZone
//       tz.initializeTimeZones();
//       final location = tz.getLocation('America/Sao_Paulo');
//
//       // Criação da configuração da notificação
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//           'channel_id',
//           'channel_name',
//           channelDescription: 'channel_description',
//           importance: Importance.max,
//           priority: Priority.high,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//           icon: '@drawable/ic_launcher'
//       );
//       const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//
//       // Agendamento da notificação para a data e hora da tarefa
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//         0,
//         'Lembrete de Tarefa',
//         'Descrição: ${tarefa.description}',
//
//         tz.TZDateTime.from(dataHoraTarefa, location),
//         platformChannelSpecifics,
//         androidAllowWhileIdle: true,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//       );
//     }
//   }
//
//
//   Future<void> enviarNotificacaoFirebase(Tarefa tarefa) async {
//     final dataHoraTarefa = DateTime.parse(tarefa.dataHora);
//     print("data da tarefa:" + dataHoraTarefa.toString());
//     final dataHoraLocal = DateTime.now();
//     print("data de agora:" + dataHoraLocal.toString());
//
//     while (dataHoraLocal.isBefore(dataHoraTarefa)) {
//         print('firebase:' + tarefa.context);
//
//         try {
//           final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
//           final String? token = await FirebaseMessaging.instance.getToken();
//           print('Tokeneeeeeeeeeeeeeeeeee: $token');
//
//           final body = {
//             'notification': {
//               'title': 'Nova Tarefa',
//               'body': tarefa.description,
//             },
//             'to': token,
//           };
//
//           final response = await http.post(
//             url,
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'key=AAAAyQa66y4:APA91bF8uh5pn8oXX4ihuvfTiL8Ecb2dgyJqPwUGYMxrhj-J49zMrq6Gok0uJO9UPHstvMbh0my_RnhfAF5WaWh4rcR-vx5X5Jg1ndOXMIH852vQ4k7d47zzrbl8C5r43OZx814j8024',
//             },
//             body: jsonEncode(body),
//           );
//
//           if (response.statusCode == 200) {
//             print('Notificação enviada com sucesso!');
//           } else {
//             print('Erro ao enviar notificação: ${response.statusCode}');
//           }
//         } catch (e) {
//           print('Erro ao enviar notificação: $e');
//         }
//       }
//     }
//
//
//   }





import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/Tarefa.dart';

// Função para lidar com as mensagens em segundo plano
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

// Classe responsável pela interação com o Firebase Cloud Messaging
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  // Criação da instância do FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Função para agendar uma notificação com base em uma tarefa
  void agendarNotificacao(Tarefa tarefa) async {
    print('TAREFA:' + tarefa.description);
    print('TAREFA:' + tarefa.dataHora);
    print('TAREFA:' + tarefa.context);

    // Obtenção da data e hora atual
    DateTime dataHoraAtual = DateTime.now();

    // Obtenção da data e hora da tarefa
    DateTime dataHoraTarefa = DateTime.parse(tarefa.dataHora);

    // Verificação se a data e hora da tarefa são iguais ou posteriores à data e hora atual
    if (dataHoraTarefa.isAfter(dataHoraAtual) || dataHoraTarefa.isAtSameMomentAs(dataHoraAtual)) {
      // As datas são válidas, então podemos agendar a notificação

      // Configuração do TimeZone
      tz.initializeTimeZones();
      final location = tz.getLocation('America/Sao_Paulo');

      // Criação da configuração da notificação
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          channelDescription: 'channel_description',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableLights: true,
          enableVibration: true,
          icon: '@drawable/ic_launcher'
      );
      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

      // Agendamento da notificação para a data e hora da tarefa
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Lembrete de Tarefa',
        'Descrição: ${tarefa.description}',

        tz.TZDateTime.from(dataHoraTarefa, location),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }


  Future<void> enviarNotificacaoFirebase(Tarefa tarefa) async {
    final dataHoraTarefa = DateTime.parse(tarefa.dataHora);
    print("data da tarefa:" + dataHoraTarefa.toString());
    final dataHoraLocal = DateTime.now();
    print("data de agora:" + dataHoraLocal.toString());

    while (dataHoraLocal.isBefore(dataHoraTarefa)) {
      if(dataHoraLocal.isAtSameMomentAs(dataHoraTarefa)) {
        print('firebase:' + tarefa.context);
        try {
          final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
          final String? token = await FirebaseMessaging.instance.getToken();
          print('Tokeneeeeeeeeeeeeeeeeee: $token');

          final body = {
            'notification': {
              'title': 'Nova Tarefa',
              'body': tarefa.description,
            },
            'to': token,
          };

          final response = await http.post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'key=AAAAyQa66y4:APA91bF8uh5pn8oXX4ihuvfTiL8Ecb2dgyJqPwUGYMxrhj-J49zMrq6Gok0uJO9UPHstvMbh0my_RnhfAF5WaWh4rcR-vx5X5Jg1ndOXMIH852vQ4k7d47zzrbl8C5r43OZx814j8024',
            },
            body: jsonEncode(body),
          );

          if (response.statusCode == 200) {
            print('Notificação enviada com sucesso!');
          } else {
            print('Erro ao enviar notificação: ${response.statusCode}');
          }
        } catch (e) {
          print('Erro ao enviar notificação: $e');
        }
      }
      }
    }
  }


