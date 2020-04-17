import 'package:flutter/material.dart';

import 'dbutton_indicator_widget.dart';

class DButtonWidget extends StatefulWidget {
  final String title;
  final Function onTapped;
  final Color color;
  final int id;

  DButtonWidget(this.id, this.title, this.onTapped, this.color);

  @override
  _dButtonWidgetState createState() => _dButtonWidgetState();
}

class _dButtonWidgetState extends State<DButtonWidget> {
  bool _isTapDown = false;

  @override
  Widget build(BuildContext context) {
    // Detect les gestes de l'utilisateurs sur le bouton
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isTapDown = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isTapDown = false;
        });
        widget.onTapped();
      },
      onTapCancel: () {
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
              color: _isTapDown ? Colors.blueGrey : widget.color,
              border: _isTapDown
                  ? null
                  : Border.all(color: Colors.blueGrey, width: 2.0),
              // Arrondi les bords du bouton
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: SizedBox(
                        child: DButtonIndicatorWidget(
                      height: 24,
                      width: 24,
                      contentStr: widget.id.toString(),
                      buttonColor: _isTapDown ? Colors.black : Colors.black54,
                    )),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
