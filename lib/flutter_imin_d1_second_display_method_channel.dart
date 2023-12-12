import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_imin_d1_second_display_platform_interface.dart';

/// An implementation of [FlutterIminD1SecondDisplayPlatform] that uses method channels.
class MethodChannelFlutterIminD1SecondDisplay extends FlutterIminD1SecondDisplayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_imin_d1_second_display');

  @override
  Future<bool?> init() async {
    return await methodChannel.invokeMethod<bool>('initLCD');
  }

  @override
  Future<bool?> wakeUp() async {
    return await methodChannel.invokeMethod<bool>('wakeUpLCD');
  }

  @override
  Future<bool?> sleep() async {
    return await methodChannel.invokeMethod<bool>('sleepLCD');
  }

  @override
  Future<bool?> clear() async {
    return await methodChannel.invokeMethod<bool>('clearLCD');
  }

  @override
  Future<bool?> sendImage(Uint8List image) async {
    return await methodChannel.invokeMethod<bool>('sendImageToLCD', image);
  }

  @override
  Future<String?> getModel() async {
    return await methodChannel.invokeMethod<String>('getModel');
  }
}
