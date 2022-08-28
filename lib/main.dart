import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MyHomePage.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Socket sock = await Socket.connect('192.168.174.174', 80);

  return runApp(PKMControllerApp(sock));
}

class PKMControllerApp extends StatelessWidget {
  Socket socket;

  PKMControllerApp(Socket s) {
    this.socket = s;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puri Controller',
      home: Scaffold(
        body: MyHomePage(channel: socket),
      ),
    );
  }
}
