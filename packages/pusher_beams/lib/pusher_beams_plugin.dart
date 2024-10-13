import 'package:flutter/foundation.dart';
import 'package:pusher_beams_platform_interface/method_channel_pusher_beams.dart';
import 'package:pusher_beams_platform_interface/pusher_beams_platform_interface.dart';

class PusherBeamsPlugin {
  factory PusherBeamsPlugin() => _instance;

  PusherBeamsPlugin._();

  static final PusherBeamsPlugin _instance = PusherBeamsPlugin._();

  static PusherBeamsPlugin get instance => _instance;

  T? resolvePlatformSpecificImplementation<T extends PusherBeamsPlatform>() {
    if (T == PusherBeamsPlatform) {
      throw ArgumentError.value(
          T,
          'The type argument must be a concrete subclass of '
          'PusherBeamsPlatform');
    }
    if (kIsWeb) {
      return null;
    }

    if (defaultTargetPlatform == TargetPlatform.android &&
        T == AndroidPusherBeamsPlugin &&
        PusherBeamsPlatform.instance is AndroidPusherBeamsPlugin) {
      return PusherBeamsPlatform.instance as T?;
    }

    return null;
  }

  Future<bool?> start(String instanceId) async {
    if (kIsWeb) {
      return true;
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidPusherBeamsPlugin.registerWith();
      return resolvePlatformSpecificImplementation<AndroidPusherBeamsPlugin>()?.start(instanceId);
    }
    return true;
  }

  Future<void> setDeviceInterests(List<String> interests) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return resolvePlatformSpecificImplementation<AndroidPusherBeamsPlugin>()?.setDeviceInterests(interests);
    }
  }

  Future<void> clearDeviceInterests() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return resolvePlatformSpecificImplementation<AndroidPusherBeamsPlugin>()?.clearDeviceInterests();
    }
  }

  Future<void> onMessageReceivedInTheForeground(OnMessageReceivedInTheForeground callback) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return resolvePlatformSpecificImplementation<AndroidPusherBeamsPlugin>()
          ?.onDidReceiveNotificationResponse(callback);
    }
  }

  Future<void> onMessageReceivedInTheBackground(OnMessageReceivedInTheBackground callback) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return resolvePlatformSpecificImplementation<AndroidPusherBeamsPlugin>()
          ?.onDidReceiveBackgroundNotificationResponse(callback);
    }
  }
}
