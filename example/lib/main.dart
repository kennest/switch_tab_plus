import 'package:flutter/material.dart';
import 'package:switch_tab/switch_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchTab(
              text: const ["History", "Account"],
              onValueChanged: (index) {},
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchTab(
              text: const ["Flutter", "React Native"],
              shape: SwitchTabShape.rectangle,
              thumbColor: Colors.orange,
              onValueChanged: (index) {},
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchTab(
              text: const ["Tab 1", "Tab 2"],
              shape: SwitchTabShape.rounded,
              selectedTextColor: Colors.white,
              thumbColor: Colors.red,
              onValueChanged: (index) {},
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchTab(
              text: const ["Home", "History"],
              icon: const [Icon(Icons.home), Icon(Icons.history)],
              shape: SwitchTabShape.rectangle,
              thumbColor: Colors.white,
              backgroundColour: Colors.lightGreen,
              onValueChanged: (index) {},
            ),
            const SizedBox(
              height: 16,
            ),
            SwitchTab(
              text: const ["Notification", "Account"],
              icon: const [
                ImageIcon(AssetImage("assets/icon_notif_active.png")),
                ImageIcon(AssetImage("assets/icon_user_active.png"))
              ],
              shape: SwitchTabShape.rectangle,
              thumbColor: Colors.white,
              backgroundColour: Colors.pinkAccent,
              onValueChanged: (index) {},
            ),
          ],
        ),
      )),
    );
  }
}
