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
  final Socket channel;

  const MyHomePage({Key key, this.channel}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isPowerActive = false;
  bool _isUVCActive = false;
  bool _isPurifierActive = false;

  @override
  void dispose() {
    widget.channel.close();
    super.dispose();
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

      String message;
      int value;

      if (!_isUVCActive) {
        message = "UVC sudah dimatikan";
        value = 6;
      } else {
        message = "UVC sudah menyala";
        value = 5;
      }

      // var message = _isUVCActive ? "UVC sudah menyala" : "UVC sudah dimatikan";
      _showSnackBar(message);
      widget.channel.write(value);
      widget.channel.write("\n");
    });
  }

  void onPowerTap() {
    setState(() {
      _isPowerActive = !_isPowerActive;

      String message;
      int value;

      if (!_isPowerActive) {
        _isUVCActive = false;
        _isPurifierActive = false;
        message = "Alat sudah dimatikan";
        value = 0;
      } else {
        message = "Alat sudah menyala";
        value = 9;
      }

      // String message =
      //     _isPowerActive ? "Alat sudah menyala" : "Alat sudah dimatikan";
      _showSnackBar(message);
      widget.channel.write(value);
      widget.channel.write("\n");
    });
  }

  void onAirPurifierTap() {
    setState(() {
      if (!_isPowerActive) {
        _showSnackBar('Harap aktifkan alat terlebih dahulu');
        return;
      }
      _isPurifierActive = !_isPurifierActive;

      String message;
      int value;

      if (!_isPurifierActive) {
        message = "Air Purifier sudah dimatikan";
        value = 8;
      } else {
        message = "Air Purifier sudah menyala";
        value = 7;
      }

      // String message =
      //     _isPowerActive ? "Alat sudah menyala" : "Alat sudah dimatikan";
      _showSnackBar(message);
      widget.channel.write(value);
      widget.channel.write("\n");
      // var message = _isPurifierActive
      //     ? "Air Purifier sudah menyala"
      //     : "Air Purifier sudah dimatikan";
      // _showSnackBar(message);
      // widget.channel.write(Feature.AIR.name);
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
        // widget.channel.write(Direction.LEFT.name);
        widget.channel.write(4);
        widget.channel.write("\n");
        break;
      case Direction.RIGHT:
        _showSnackBar("${Direction.RIGHT.name}");
        // widget.channel.write(Direction.RIGHT.name);
        widget.channel.write(3);
        widget.channel.write("\n");
        break;
      case Direction.UP:
        _showSnackBar("${Direction.UP.name}");
        // widget.channel.write(Direction.UP.name);
        widget.channel.write(1);
        widget.channel.write("\n");
        break;
      case Direction.DOWN:
        _showSnackBar("${Direction.DOWN.name}");
        // widget.channel.write(Direction.DOWN.name);
        widget.channel.write(2);
        widget.channel.write("\n");
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
