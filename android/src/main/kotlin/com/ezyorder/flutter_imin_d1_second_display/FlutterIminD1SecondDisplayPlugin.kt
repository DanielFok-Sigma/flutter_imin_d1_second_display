package com.ezyorder.flutter_imin_d1_second_display

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.util.Base64
import androidx.annotation.NonNull
import com.imin.image.ILcdManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.ByteArrayOutputStream


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
        ILcdManager.getInstance(context).sendLCDCommand(1)
      }
      "wakeUpLCD" -> {
        ILcdManager.getInstance(context).sendLCDCommand(2)
      }
      "sleepLCD" -> {
        ILcdManager.getInstance(context).sendLCDCommand(3)
      }
      "clearLCD" -> {
        ILcdManager.getInstance(context).sendLCDCommand(4)
      }
      "sendImageToLCD" -> {
        val data = call.arguments as ByteArray
        val bitmap = byteArrayToBitmap(data)
        ILcdManager.getInstance(this).sendLCDBitmap(bitmap)
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


}
