import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Chat',
        theme: ThemeData(
          primaryColor: Colors.green,

        ),
        home: HomeScreen(),
      );
  }

}
