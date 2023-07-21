import 'dart:typed_data';

import 'flutter_imin_d1_second_display_platform_interface.dart';

export 'helpers/widget_to_image_helper.dart';

class FlutterIminD1SecondDisplay {
  //Initialize the LCD display
  Future<bool?> init() async {
    return FlutterIminD1SecondDisplayPlatform.instance.init();
  }

  //Wake up the LCD display
  Future<bool?> wakeUp() async {
    return FlutterIminD1SecondDisplayPlatform.instance.wakeUp();
  }

  //Hibernate the LCD display
  Future<bool?> sleep() async {
    return FlutterIminD1SecondDisplayPlatform.instance.sleep();
  }

  //Clear the LCD display
  Future<bool?> clear() async {
    return FlutterIminD1SecondDisplayPlatform.instance.clear();
  }

  //Send the image to the LCD display
  Future<bool?> sendImage(Uint8List image) async {
    return FlutterIminD1SecondDisplayPlatform.instance.sendImage(image);
  }
}
