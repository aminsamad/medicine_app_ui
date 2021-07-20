import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicine_app_ui/home_page.dart';

const Color mainTextColor = Color(0xff0b0b0b);

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Medicine App Ui",
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: Color(0xffFEFEFE),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          fontFamily: "english",
          iconTheme: IconThemeData(color: mainTextColor)),
      home: HomePageScreen(),
    );
  }
}
