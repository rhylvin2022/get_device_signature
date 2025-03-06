package com.example.get_device_signature

import android.content.pm.PackageManager
import android.content.pm.PackageInfo
import android.util.Base64
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** GetDeviceSignaturePlugin */
class GetDeviceSignaturePlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    this.flutterPluginBinding = flutterPluginBinding
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "get_device_signature")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getDeviceSignature") {
      val signature = getAppSignature()
      if (signature != null) {
        result.success(signature)
      } else {
        result.error("SIGNATURE_ERROR", "Failed to get app signature", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun getAppSignature(): String? {
    try {
      val packageName = flutterPluginBinding.applicationContext.packageName
      val packageManager = flutterPluginBinding.applicationContext.packageManager
      val packageInfo: PackageInfo = packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNATURES)

      for (signature in packageInfo.signatures) {
        val md = MessageDigest.getInstance("SHA-1")
        md.update(signature.toByteArray())
        return md.digest().joinToString(":") { byte -> "%02X".format(byte) }
      }
    } catch (e: PackageManager.NameNotFoundException) {
      e.printStackTrace()
    } catch (e: NoSuchAlgorithmException) {
      e.printStackTrace()
    }
    return null
  }
}
