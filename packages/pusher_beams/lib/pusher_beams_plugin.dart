import 'package:flutter/foundation.dart';
import 'package:pusher_beams_platform_interface/method_channel_pusher_beams.dart';
import 'package:pusher_beams_platform_interface/pusher_beams_platform_interface.dart';

class PusherBeamsPlugin {
  factory PusherBeamsPlugin() => _instance;

  PusherBeamsPlugin._();

  static final PusherBeamsPlugin _instance = PusherBeamsPlugin._();

  static PusherBeamsPlugin get instance => _instance;

  /// Returns the underlying platform-specific implementation of given type [T],
  /// which must be a concrete subclass of [PusherBeamsPlatform]
  ///
  /// Requires running on the appropriate platform that matches the specified
  /// type for a result to be returned. For example, when the specified type
  /// argument is of type [AndroidPusherBeamsPlugin], this will
  /// only return a result of that type when running on Android.
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
    //  else if (defaultTargetPlatform == TargetPlatform.iOS &&
    //     T == IOSFlutterLocalNotificationsPlugin &&
    //     PusherBeamsPlatform.instance is IOSFlutterLocalNotificationsPlugin) {
    //   return PusherBeamsPlatform.instance as T?;
    // } else if (defaultTargetPlatform == TargetPlatform.macOS &&
    //     T == MacOSFlutterLocalNotificationsPlugin &&
    //     PusherBeamsPlatform.instance is MacOSFlutterLocalNotificationsPlugin) {
    //   return PusherBeamsPlatform.instance as T?;
    // } else if (defaultTargetPlatform == TargetPlatform.linux &&
    //     T == LinuxFlutterLocalNotificationsPlugin &&
    //     PusherBeamsPlatform.instance is LinuxFlutterLocalNotificationsPlugin) {
    //   return PusherBeamsPlatform.instance as T?;
    // }

    return null;
  }

  Future<bool?> start(String instanceId) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
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
