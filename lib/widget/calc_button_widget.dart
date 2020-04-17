import 'package:flutter/material.dart';

class CalcButtonWidget extends StatefulWidget {
  final String title;
  final Function onTapped;
  final Color color;

  CalcButtonWidget(this.title, this.onTapped, this.color);

  @override
  _CalcButtonWidgetState createState() => _CalcButtonWidgetState();
}

class _CalcButtonWidgetState extends State<CalcButtonWidget> {
  bool _isTapDown = false;

  @override
  Widget build(BuildContext context) {
    // Detect les gestes de l'utilisateurs sur le bouton
    return GestureDetector(
      onTapDown: (details) {
        print('ontapdown');
        setState(() {
          _isTapDown = true;
        });
      },
      onTapUp: (details) {
        print('ontapup');
        setState(() {
          _isTapDown = false;
        });
        widget.onTapped();
      },
      onTapCancel: () {
        print('ontapcancel');
        setState(() {
          _isTapDown = false;
        });
      },
      child: Container(
        height: 48,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                color: _isTapDown ? Colors.blueGrey : widget.color),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
