import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MyHomePage.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  return runApp(PKMControllerApp());
}

class PKMControllerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puri Controller',
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}
