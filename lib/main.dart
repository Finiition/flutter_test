import 'dart:async';
import 'dart:io';

import 'package:discorverflutter/page/menu_page.dart';
import 'package:discorverflutter/stream/timer_stream_helper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static List<File> images = [];

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  _initTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('Timer ' + DateTime.now().millisecondsSinceEpoch.toString());

      // BROADCAST DATA TO STREAM
      TimerStreamHelper.getSingelton().streamController.add("I got a new Time");

      TimerStreamHelper.getSingelton()
          .streamController
          .add(DateTime.now().millisecondsSinceEpoch);
    });
  }

  _disposeTimer() {
    timer?.cancel();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discover Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MenuPage(),
    );
  }
}
