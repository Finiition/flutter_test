import 'package:flutter/material.dart';

class PassDataSecondPage extends StatefulWidget {
  List<String> catBreeds = [
    'American Curl',
    'American Bobtall',
    'Abyssinian',
    'Bombay',
    'Burmese',
  ];

  @override
  _PassDataSecondPageState createState() => _PassDataSecondPageState();
}

class _PassDataSecondPageState extends State<PassDataSecondPage> {
  String _selectedCatBreed;

  @override
  void initState() {
    super.initState();

    _selectedCatBreed = widget.catBreeds[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('On back button pressed');
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Pass data - Seond Page',
            ),
            centerTitle: true,
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                items: _dropListItem(),
                onChanged: (value) {
                  print('Value changed');

                  setState(() {
                    _selectedCatBreed = value;
                  });
                },
                value: _selectedCatBreed,
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: _okPressed,
                child: Text(
                  'Ok',
                ),
              )
            ],
          ))),
    );
  }

  List<DropdownMenuItem<String>> _dropListItem() {
    List<DropdownMenuItem<String>> listMenuItem = [];

    for (String catBreedStr in widget.catBreeds) {
      listMenuItem.add(DropdownMenuItem<String>(
        value: catBreedStr,
        child: Text(catBreedStr),
      ));
    }

    return listMenuItem;
  }

  _okPressed() {
    Navigator.pop(context, _selectedCatBreed);
  }
}
