import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_udevs/data/models/task_model.dart';

class LocalNotificationService {
  static final LocalNotificationService localNotificationService =
      LocalNotificationService._();

  factory LocalNotificationService() {
    return localNotificationService;
  }

  LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void init() {
    // Android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("app_icon");

    //IOS
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    //Set
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) {
        //Android
        if (notificationResponse.payload != null) {
          // Navigator.push(navigatorKey.currentContext!,
          //     MaterialPageRoute(builder: (context) {
          //       return Scaffold();
          //     }));

          debugPrint('PAYLOAD RESULT------> ${notificationResponse.payload}');
        } else {
          debugPrint("PAYLOAD RESULT NULL");
        }
      },
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    tz.initializeTimeZones();
  }

  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    debugPrint("TAPPED FROM BACKGROUND");
  }

// Android

  //IOS
  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    debugPrint(payload);
  }

  //channel
  AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel(
    "my_channel",
    "Notification Lesson ",
    importance: Importance.max,
    description: "My Notification description",
  );

  void showNotification({
    required int id,
    required title,
    String subtitle = "",
  }) {
    flutterLocalNotificationsPlugin.show(
      id,
      subtitle.isEmpty ? "Someone" : title,
      subtitle.isEmpty ? "Hello $title" : subtitle,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          priority: Priority.max,
          playSound: true,
          icon: "app_icon",
          showProgress: true,
          largeIcon: const DrawableResourceAndroidBitmap('app_icon'),
        ),
      ),
      payload: "SIMPLE NOTIFICATION DATA ID:$id",
    );
  }

  void scheduleNotification(
      {required EventModel event, required int delayedTime}) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      event.id!,
      "Do not forget your event!",
      event.name,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: delayedTime)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          priority: Priority.high,
          playSound: true,
          channelDescription: 'To remind you about upcoming birthdays',
        ),
      ),
      payload: "SCHEADULED NOTIFICATION PAYLOAD DATA",
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // void showPeriodically({required int id}) async {
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     id,
  //     'Bu notification',
  //     'Rostan notification',
  //     RepeatInterval.everyMinute,
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         androidNotificationChannel.id,
  //         androidNotificationChannel.name,
  //         channelDescription: 'To remind you about upcoming birthdays',
  //       ),
  //     ),
  //     androidAllowWhileIdle: true,
  //     payload: "PERIODICALLY NOTIFICACYION DATA ID:$id",
  //   );
  // }

  void cancelAllNotifications() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  void cancelNotificationById(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
