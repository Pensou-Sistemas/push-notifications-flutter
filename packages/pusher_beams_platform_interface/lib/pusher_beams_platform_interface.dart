library pusher_beams_platform_interface;

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'method_channel_pusher_beams.dart';

typedef OnUserCallback = Function(String? error);
typedef OnInterestsChange = Function(List<String?> interests);
typedef OnMessageReceivedInTheForeground = Function(Map<Object?, Object?> data);
typedef OnMessageReceivedInTheBackground = Function(Map<Object?, Object?> data);

/// The interface that all implementations of pusher_beams must implement.
abstract class PusherBeamsPlatform extends PlatformInterface {
  /// Constructs an instance of [PusherBeamsPlatform]
  PusherBeamsPlatform() : super(token: _token);

  static PusherBeamsPlatform _instance = PusherBeamsApi();

  static final Object _token = Object();

  /// The default instance of [PusherBeamsPlatform] to use.
  static PusherBeamsPlatform get instance => _instance;

  static set instance(PusherBeamsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> start(String instanceId) {
    throw UnimplementedError('start() has not been implemented.');
  }

  Future<dynamic> getInitialMessage() {
    throw UnimplementedError('getInitialMessage() has not been implemented.');
  }

  Future<void> addDeviceInterest(String interest) {
    throw UnimplementedError('addDeviceInterest() has not been implemented.');
  }

  Future<void> removeDeviceInterest(String interest) {
    throw UnimplementedError('removeDeviceInterest() has not been implemented.');
  }

  Future<List<String?>> getDeviceInterests() {
    throw UnimplementedError('getDeviceInterests() has not been implemented.');
  }

  Future<void> setDeviceInterests(List<String> interests) {
    throw UnimplementedError('setDeviceInterests() has not been implemented.');
  }

  Future<void> clearDeviceInterests() {
    throw UnimplementedError('clearDeviceInterests() has not been implemented.');
  }

  Future<void> onInterestChanges(String callbackId) {
    throw UnimplementedError('onInterestChanges() has not been implemented.');
  }

  Future<void> setUserId(String userId, BeamsAuthProvider provider, String callbackId) {
    throw UnimplementedError('setUserId() has not been implemented.');
  }

  Future<void> clearAllState() {
    throw UnimplementedError('clearAllState() has not been implemented.');
  }

  Future<void> stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }

  Future<void> onMessageReceivedInTheForeground(String callbackId) {
    throw UnimplementedError('onMessageReceivedInTheForeground() has not been implemented.');
  }

  Future<void> onMessageReceivedInTheBackground(String callbackId) {
    throw UnimplementedError('onMessageReceivedInTheBackground() has not been implemented.');
  }
}
