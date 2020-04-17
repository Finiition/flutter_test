import 'package:discorverflutter/page/pass_data_second_page.dart';
import 'package:flutter/material.dart';

class PassDataMainPage extends StatefulWidget {
  @override
  _PassDataMainPageState createState() => _PassDataMainPageState();
}

class _PassDataMainPageState extends State<PassDataMainPage> {
  String _selectCatBreed = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pass data',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: FlatButton(
                  onPressed: _buttonPressed,
                  color: Colors.blueGrey,
                  child: Text(
                    'SELECT A CAT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text(_selectCatBreed ?? ""),
            ],
          ),
        ));
  }

  _buttonPressed() async {
    print('Button pressed');
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PassDataSecondPage();
    }));

    print('result : $result');

    if (result != null) {
      setState(() {
        _selectCatBreed = result;
      });
    }
  }
}
