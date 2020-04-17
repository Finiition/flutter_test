import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DartAsyncPage extends StatefulWidget {
  @override
  _DartAsyncPageState createState() => _DartAsyncPageState();
}

class _DartAsyncPageState extends State<DartAsyncPage> {
  String _textInfos = 'Paused';

  IconData _icon = Icons.play_arrow;

  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dart Async and Future'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // Alignement sur le main
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _textField(),
              Container(height: 21),
              _button(),
              Container(height: 21),
              Text(_textInfos,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField() {
    return SizedBox(
      width: 120,
      child: TextField(
        // Ouvre le clavier automatiquement vie autofocus
        autofocus: true,
        controller: _editingController,
        keyboardType:
            TextInputType.numberWithOptions(signed: false, decimal: false),
        inputFormatters: [
          // Seulement des chiffres, et avec 2 décimals
          WhitelistingTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2)
        ],
        textInputAction: TextInputAction.send,
        decoration: InputDecoration(hintText: 'Seconds to wait'),
      ),
    );
  }

  Widget _button() {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Theme.of(context).primaryColor,
      onPressed: () {
        print('Test');
        _buttonClicked();
      },
      child: Icon(
        _icon,
        color: Colors.white,
        size: 36,
      ),
      // Ombre
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      padding: const EdgeInsets.all(8),
    );
  }

  _buttonClicked() async {
    print('Start Button clicked');
    String temps = _editingController.text;
    _changeTextInfo('Waiting $temps seconds ...');

    _icon = Icons.refresh;

    // Callback block of code when future is finished
//    _performTask().then((value) {
//	    print('After perform task : $value');
//    });
//    print('End Button clicked');

    // wait for future finish and get the value
    String value = await _performTask();
    _changeTextInfo(value);
    _icon = Icons.play_arrow;
    _editingController.clear();
    print('After perform tack');
    print('End Button clicked');
  }

  // Méthode asynchrone avec await
  // Future permet d'appeler les méthodes telle que then
  // Execution dans un Thread
  Future<String> _performTask() async {
    print('Start Performing task');
//    Future.delayed(Duration(seconds: 2), () {
//      print('End after delayed call back');
//    });

    int _time = int.parse(_editingController.text);
    for (var i = 0; i < _time; i += 1) {
      _changeTextInfo((_time - i).toString());
      // Attendre une autre méthode asynchrone
      await Future.delayed(Duration(seconds: 1), () {});
    }

    print('End Performing task');
    return 'Finished';
  }

  _changeTextInfo(String text) {
    setState(() {
      _textInfos = text;
    });
  }
}
