import 'package:flutter/material.dart';

import 'shared.dart';
import 'AppColors.dart';

class MainController extends StatelessWidget {
  final Function onArrowTapHandler;

  const MainController({
    Key key,
    this.onArrowTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Material(
      child: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => onArrowTapHandler(Direction.UP),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    width: size.height * 0.1,
                    height: size.height * 0.1,
                    decoration: new BoxDecoration(
                      color: buttonBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: icon,
                      size: 48,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 88),
                  child: InkWell(
                    onTap: () => onArrowTapHandler(Direction.LEFT),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      width: size.height * 0.1,
                      height: size.height * 0.1,
                      decoration: new BoxDecoration(
                        color: buttonBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: icon,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => onArrowTapHandler(Direction.RIGHT),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    width: size.height * 0.1,
                    height: size.height * 0.1,
                    decoration: new BoxDecoration(
                      color: buttonBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: icon,
                      size: 48,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () => onArrowTapHandler(Direction.DOWN),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    width: size.height * 0.1,
                    height: size.height * 0.1,
                    decoration: new BoxDecoration(
                      color: buttonBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: icon,
                      size: 48,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
