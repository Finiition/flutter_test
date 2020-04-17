import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  final TextEditingController _editingController = TextEditingController();

  String _helloMessage = 'Hello ...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _editingController,
                  decoration: InputDecoration(hintText: 'Enter your name : '),
                ),
                Expanded(
                  child: Container(
                    color: Colors.yellow,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          _helloMessage,
                          style: TextStyle(fontSize: 48),
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  color: Colors.green,
                  child: Text('Say Hello', style: TextStyle(fontSize: 21)),
                  onPressed: () {
                    String myText = _editingController.text;
                    print('Hello ' + myText);

                    // Fait évoluer seulement les parties qui sont mise à jour
                    setState(() {
                      _helloMessage = 'Hello ' + myText;
                    });

                    // Clear text field
                    _editingController.clear();
                  },
                )
              ]),
        ));
  }
}
