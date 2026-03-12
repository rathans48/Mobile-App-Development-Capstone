import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart'; // Imports the notification plugin from main

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String savedData = "No data saved yet";
  bool isNotificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Local Storage Logic
  saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('test_key', 'Persistence Verified!');
    loadData();
  }

  loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() { savedData = prefs.getString('test_key') ?? "No data saved yet"; });
  }

  // Fire the Notification
  Future<void> showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id', 'your_channel_name',
      importance: Importance.max, priority: Priority.high, showWhen: false);
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'Test Alert', 'This is a successful notification!', platformChannelSpecifics);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text("Enable Notifications"),
            value: isNotificationsEnabled,
            onChanged: (val) {
              setState(() => isNotificationsEnabled = val);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Trigger Test Notification"),
            trailing: Icon(Icons.notifications_active),
            onTap: showNotification,
          ),
          Divider(),
          ListTile(
            title: Text("Save Data to Local Storage"),
            trailing: Icon(Icons.save),
            onTap: saveData,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Data from Storage: $savedData", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}