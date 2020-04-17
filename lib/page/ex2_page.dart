import 'package:flutter/material.dart';

class Exercice2 extends StatefulWidget {
  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  static const _kFontFam = 'MyFlutterApp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter layout demo')),
      body: Container(
        child: Column(
          children: <Widget>[
            // Image
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('graphics/lake.png'))),
              ),
            ),
            // Titre image
            Container(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Oeschinen Lake Campground',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'With a sneaky cat',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    IconData(0xf1b0, fontFamily: _kFontFam),
                    color: Colors.red,
                  ),
                  Text('41'),
                ],
              ),
            ),
//            // Bouttons
            Container(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.call, color: Colors.blue),
                        ),
                        Text('Call',
                            style: TextStyle(
                              color: Colors.blue,
                            ))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.router, color: Colors.blue),
                        ),
                        Text('Route',
                            style: TextStyle(
                              color: Colors.blue,
                            ))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.share, color: Colors.blue),
                        ),
                        Text('Share',
                            style: TextStyle(
                              color: Colors.blue,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                    child: Text(
                  'Un chat est caché dans cette image'
                  '. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
