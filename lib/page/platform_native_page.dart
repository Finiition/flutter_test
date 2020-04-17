import 'package:discorverflutter/platform/platform_channel_helper.dart';
import 'package:flutter/material.dart';

class PlatformNativePage extends StatefulWidget {
  @override
  _PlatformNativePageState createState() => _PlatformNativePageState();
}

class _PlatformNativePageState extends State<PlatformNativePage> {
  String message = "No message";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Platform native message'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text('Refresh'),
                onPressed: () {
                  _refreshMessage();
                },
              ),
              Text(message),
            ],
          ),
        ));
  }

  _refreshMessage() {
    PlateformChannelHelper.getNativeHello().then((nativeMessage) {
      String messageNatif = nativeMessage.toString();

      setState(() {
        message = messageNatif;
      });
    });
  }
}
