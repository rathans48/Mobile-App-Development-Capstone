import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'login.dart';
import 'signup.dart';
import 'home.dart';
import 'settings.dart';

// Global plugin for notifications
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Notification Setup
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MaterialApp(
    title: 'Assignment App',
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginScreen(),
      '/signup': (context) => SignupScreen(),
      '/home': (context) => HomeScreen(),
      '/settings': (context) => SettingsScreen(),
    },
    debugShowCheckedModeBanner: false
  ));
}