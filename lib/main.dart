import 'package:flutter/material.dart';
import 'package:qyre_test/views/screens/home/screen.dart';

void main() {
  runApp(const QyreTestApp());
}

class QyreTestApp extends StatelessWidget {
  const QyreTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qyre Test',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
