import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'CameraView.dart';
import 'Header.dart';
import 'MainController.dart';
import 'Power.dart';
import 'shared.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Socket channel;
  bool _isPowerActive = false;
  bool _isUVCActive = false;
  bool _isPurifierActive = false;

  @override
  void initState() {
    _connectSocket();
    super.initState();
  }

  @override
  void dispose() {
    // channel.close();
    super.dispose();
  }

  void _connectSocket() async {
    // channel = await Socket.connect('192.168.1.104', 80);
  }

  void _showSnackBar(String msg) {
    final snackBar = SnackBar(
        content: Text('$msg'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 500));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void onUVCTap() {
    setState(() {
      if (!_isPowerActive) {
        _showSnackBar('Harap aktifkan alat terlebih dahulu');
        return;
      }
      _isUVCActive = !_isUVCActive;

      var message = _isUVCActive ? "UVC sudah menyala" : "UVC sudah dimatikan";
      _showSnackBar(message);
      // channel.write(Feature.UVC.name);
    });
  }

  void onPowerTap() {
    setState(() {
      _isPowerActive = !_isPowerActive;
      if (!_isPowerActive) {
        _isUVCActive = false;
        _isPurifierActive = false;
      }

      var message =
          _isPowerActive ? "Alat sudah menyala" : "Alat sudah dimatikan";
      _showSnackBar(message);
      // channel.write(Feature.POWER.name);
    });
  }

  void onAirPurifierTap() {
    setState(() {
      if (!_isPowerActive) {
        _showSnackBar('Harap aktifkan alat terlebih dahulu');
        return;
      }
      _isPurifierActive = !_isPurifierActive;
      var message = _isPurifierActive
          ? "Air Purifier sudah menyala"
          : "Air Purifier sudah dimatikan";
      _showSnackBar(message);
      // channel.write(Feature.AIR.name);
    });
  }

  void onArrowTap(Direction key) {
    if (!_isPowerActive) {
      _showSnackBar('Harap aktifkan alat terlebih dahulu');
      return;
    }

    switch (key) {
      case Direction.LEFT:
        _showSnackBar("${Direction.LEFT.name}");
        // channel.write(Feature.LEFT.name);
        break;
      case Direction.RIGHT:
        _showSnackBar("${Direction.RIGHT.name}");
        // channel.write(Feature.RIGHT.name);
        break;
      case Direction.UP:
        _showSnackBar("${Direction.UP.name}");
        // channel.write(Feature.UP.name);
        break;
      case Direction.DOWN:
        _showSnackBar("${Direction.DOWN.name}");
        // channel.write(Feature.DOWN.name);
        break;
      default:
        _showSnackBar("Arah tidak diketahui");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        color: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Header(),
            Column(
              children: [
                CameraView(),
                Power(
                  isUVCActive: _isUVCActive,
                  isPowerActive: _isPowerActive,
                  isPurifierActive: _isPurifierActive,
                  onUVCTap: onUVCTap,
                  onPowerTap: onPowerTap,
                  onAirPurifierTap: onAirPurifierTap,
                ),
                MainController(
                  onArrowTapHandler: onArrowTap,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
