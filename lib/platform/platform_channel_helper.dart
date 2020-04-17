import 'package:flutter/services.dart';

class PlateformChannelHelper {
  static const platform =
      const MethodChannel("fr.mds.discorverflutter_android/platform_channel");
  static Future getNativeHello() async {
    //GET MESSAGE FROM NATIVE CODE
    String message;
    try {
      message = await platform.invokeMethod('helloMessage');
    } on PlatformException catch (e) {
      print(e.toString());
      return "";
    }
    return message;
  }
}
