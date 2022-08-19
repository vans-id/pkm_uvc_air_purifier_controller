import 'package:flutter/material.dart';

import 'AppColors.dart';

class Power extends StatelessWidget {
  final bool isUVCActive;
  final bool isPowerActive;
  final bool isPurifierActive;
  final Function onUVCTap;
  final Function onPowerTap;
  final Function onAirPurifierTap;

  const Power({
    Key key,
    this.isUVCActive,
    this.isPowerActive,
    this.isPurifierActive,
    this.onUVCTap,
    this.onPowerTap,
    this.onAirPurifierTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        child: Material(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () => onUVCTap(),
                child: Container(
                  width: size.height * 0.08,
                  height: size.height * 0.08,
                  decoration: new BoxDecoration(
                    color: buttonBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lightbulb,
                    color: isUVCActive ? Color(0xFF59C533) : icon,
                    size: 24,
                  ),
                ),
              ),
              InkWell(
                onTap: () => onPowerTap(),
                child: Container(
                  padding: EdgeInsets.all(2),
                  width: size.height * 0.11,
                  height: size.height * 0.11,
                  decoration: new BoxDecoration(
                    color: buttonBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.power_settings_new,
                    color:
                        isPowerActive ? Color(0xFF59C533) : Color(0xFFEF5252),
                    size: 38,
                  ),
                ),
              ),
              InkWell(
                onTap: () => onAirPurifierTap(),
                child: Container(
                  width: size.height * 0.08,
                  height: size.height * 0.08,
                  decoration: new BoxDecoration(
                    color: buttonBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.air,
                    color: isPurifierActive ? Color(0xFF59C533) : icon,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
