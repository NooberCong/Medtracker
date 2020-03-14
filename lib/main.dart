import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xffF8F9F7),
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xff334E6C),
          accentColor: Color(0xff2ACB6B),
          fontFamily: 'Montserrat'),
      home: HomeScreen(),
    );
  }
}
