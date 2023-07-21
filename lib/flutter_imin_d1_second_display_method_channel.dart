import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_imin_d1_second_display_platform_interface.dart';

/// An implementation of [FlutterIminD1SecondDisplayPlatform] that uses method channels.
class MethodChannelFlutterIminD1SecondDisplay extends FlutterIminD1SecondDisplayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_imin_d1_second_display');

  @override
  Future<void> init() async {
    await methodChannel.invokeMethod<void>('initLCD');
  }

  @override
  Future<void> wakeUp() async {
    await methodChannel.invokeMethod<void>('wakeUpLCD');
  }

  @override
  Future<void> sleep() async {
    await methodChannel.invokeMethod<void>('sleepLCD');
  }

  @override
  Future<void> clear() async {
    await methodChannel.invokeMethod<void>('clearLCD');
  }

  @override
  Future<void> sendImage(Uint8List image) async {
    await methodChannel.invokeMethod<Uint8List>('sendImageToLCD', image);
  }


}
