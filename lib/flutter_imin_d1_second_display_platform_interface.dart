import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_imin_d1_second_display_method_channel.dart';

abstract class FlutterIminD1SecondDisplayPlatform extends PlatformInterface {
  /// Constructs a FlutterIminD1SecondDisplayPlatform.
  FlutterIminD1SecondDisplayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterIminD1SecondDisplayPlatform _instance = MethodChannelFlutterIminD1SecondDisplay();

  /// The default instance of [FlutterIminD1SecondDisplayPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterIminD1SecondDisplay].
  static FlutterIminD1SecondDisplayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterIminD1SecondDisplayPlatform] when
  /// they register themselves.
  static set instance(FlutterIminD1SecondDisplayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> init() {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<bool?> wakeUp() {
    throw UnimplementedError('wakeUp() has not been implemented.');
  }

  Future<bool?> sleep() {
    throw UnimplementedError('sleep() has not been implemented.');
  }

  Future<bool?> clear() {
    throw UnimplementedError('clear() has not been implemented.');
  }

  Future<bool?> sendImage(Uint8List image) {
    throw UnimplementedError('sendImage() has not been implemented.');
  }

  Future<String?> getModel() {
    throw UnimplementedError('getModel() has not been implemented.');
  }
}
