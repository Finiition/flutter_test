import 'package:flutter/material.dart';

class DButtonIndicatorWidget extends StatelessWidget {
  final double height, width;
  final String contentStr;
  final Color buttonColor;

  DButtonIndicatorWidget(
      {@required this.height,
      @required this.width,
      @required this.contentStr,
      @required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: buttonColor, shape: BoxShape.circle),
      child: Center(
        child: Text(
          contentStr,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
