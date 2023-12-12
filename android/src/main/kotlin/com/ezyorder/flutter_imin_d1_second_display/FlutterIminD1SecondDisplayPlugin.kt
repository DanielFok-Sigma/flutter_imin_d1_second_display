package com.ezyorder.flutter_imin_d1_second_display

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import com.imin.image.ILcdManager
import com.imin.library.SystemPropManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlutterIminD1SecondDisplayPlugin */
class FlutterIminD1SecondDisplayPlugin : FlutterPlugin, MethodCallHandler, FlutterActivity() {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel =
      MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_imin_d1_second_display")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "initLCD" -> {
        try {
          ILcdManager.getInstance(context).sendLCDCommand(1)
          result.success(true)
        }catch (e: Exception){
          result.success(false)
        }
      }
      "wakeUpLCD" -> {
        try {
          ILcdManager.getInstance(context).sendLCDCommand(2)
          result.success(true)
        }catch (e: Exception){
          result.success(false)
        }
      }
      "sleepLCD" -> {
        try {
          ILcdManager.getInstance(context).sendLCDCommand(3)
          result.success(true)
        }catch (e: Exception){
          result.success(false)
        }
      }
      "clearLCD" -> {
        try {
          ILcdManager.getInstance(context).sendLCDCommand(4)
          result.success(true)
        }catch (e: Exception){
          result.success(false)
        }
      }
      "sendImageToLCD" -> {
        try {
          val data = call.arguments as ByteArray
          val bitmap = byteArrayToBitmap(data)
          ILcdManager.getInstance(this).sendLCDBitmap(bitmap)
          result.success(true)
        }catch (e: Exception){
          result.success(false)
        }



      }
      "getModel" -> {
        try {
          val model = getModel()
          result.success(model)
        }catch (e: Exception){
          result.success("")
        }
      }

      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun byteArrayToBitmap(byteArray: ByteArray): Bitmap? {
    // Use BitmapFactory to decode the ByteArray into a Bitmap
    return BitmapFactory.decodeByteArray(byteArray, 0, byteArray.size)
  }


  private fun getModel(): String {
    return SystemPropManager.getModel();
  }


}
