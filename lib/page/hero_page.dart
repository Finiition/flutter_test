import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(children: <Widget>[
          Hero(
            tag: 'welcome',
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('graphics/cat.jpg'))),
            ),
          ),
          Container(
            width: 12,
          ),
          Text('Hero Animation')
        ]),
      ),
      body: Container(),
    );
  }
}
