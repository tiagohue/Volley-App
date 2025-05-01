import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: Color(0xff2B4A8E),
          secondary: Colors.yellow,
          onSecondary: Colors.yellow,
          error: Colors.red,
          onError: Colors.red,
          surface: Color(0xff00ADC3),
          onSurface: Colors.red,
        ),
        textTheme: TextTheme(
          labelMedium: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'ConcertOne',
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontFamily: 'ConcertOne',
          ),
          titleSmall: TextStyle(
            color: Color(0xff2B4A8E),
            fontSize: 25,
            fontFamily: 'ConcertOne',
          ),
        ),
        useMaterial3: true,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}
