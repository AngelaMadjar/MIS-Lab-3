import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mis_lab3_181010/screens/exam_calendar.dart';
import 'package:mis_lab3_181010/screens/exam_details.dart';
import 'package:mis_lab3_181010/screens/main_screen.dart';

void main() {
  runApp(MaterialApp(
    // home: MainScreen(),
    initialRoute: '/',
    routes: {
      '/':(ctx) => MainScreen(),
      ExamDetailScreen.routeName: (ctx) => ExamDetailScreen(),
      CalendarScreen.routeName: (ctx) => CalendarScreen(),
    },
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}