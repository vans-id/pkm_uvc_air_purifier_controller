import 'package:flutter/material.dart';
import 'AppColors.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Puri',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: text,
                  fontSize: 20,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Controller',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: text,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.personal_video,
              color: select,
              size: 28,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: select,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
