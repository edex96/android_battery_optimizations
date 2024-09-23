import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class AndroidBatteryOptimizations {
  static const MethodChannel _channel =
      MethodChannel('android_battery_optimizations');

  static Future<bool> isEnabled() async {
    if (Platform.isAndroid) {
      final bool? status = await _channel.invokeMethod('isEnabled');
      return status ?? false;
    } else {
      return false;
    }
  }

  static Future<void> showPermissionDialog() async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod('showPermissionDialog');
    }
  }
}
