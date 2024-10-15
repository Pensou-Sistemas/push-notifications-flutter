// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:pusher_beams_platform_interface/method_channel_pusher_beams.dart';
// import 'package:pusher_beams_platform_interface/pusher_beams_platform_interface.dart';
// import 'package:uuid/uuid.dart';

// export 'package:pusher_beams_platform_interface/method_channel_pusher_beams.dart' show BeamsAuthProvider;

// const _uuid = Uuid();

// /// App-facing Implementation for [PusherBeamsPlatform] plugin.
// /// It's designed to be a singleton and must be consumed with [PusherBeams.instance].
// class PusherBeams extends PusherBeamsPlatform with CallbackHandlerApi {
//   /// Stores the ids and the [Function]s to call back.
//   static final Map<String, Function> _callbacks = {};

//   static final PusherBeamsApi _pusherBeamsApi = PusherBeamsPlatform.instance;

//   PusherBeams._privateConstructor() {
//     if (!kIsWeb) {
//       CallbackHandlerApi.setup(this);
//     }
//   }

//   static final PusherBeams _instance = PusherBeams._privateConstructor();

//   /// The instance of [PusherBeams].
//   /// This is intended to be a singleton
//   static PusherBeams get instance => _instance;

//   /// Reads the [info] key included in a Push Notification when opening the app
//   /// by tapping on it.
//   ///
//   /// ## Example Usage
//   ///
//   /// ```dart
//   /// function someAsyncFunction() async {
//   ///   final message = await PusherBeams.instance.getInitialMessage();
//   /// }
//   /// ```
//   ///
//   /// In order to receive data the published payload must contain an [info] key
//   /// in the [data] key:
//   ///
//   /// ```json
//   /// {
//   ///   "interests":["hello"],
//   ///   "apns": {
//   ///     "aps": {
//   ///       "alert": {"title":"Hello", "body":"Hello, world!"},
//   ///     },
//   ///    "data": {
//   ///       "info": { "name": "george" }
//   ///     }
//   ///   },
//   ///   "fcm": {
//   ///     "notification": {"title":"Hello", "body":"Hello, world!"},
//   ///     "data": {
//   ///       "info": { "name": "george" }
//   ///     }
//   ///   }
//   /// }
//   /// ```
//   /// Throws an [Exception] in case of failure.
//   @override
//   Future<Map<String, dynamic>?> getInitialMessage() async {
//     return await _pusherBeamsApi.getInitialMessage();
//   }

//   /// Adds an [interest] in this device.
//   ///
//   /// ## Example Usage
//   ///
//   /// ```dart
//   /// function someAsyncFunction() async {
//   ///   await PusherBeams.instance.addDeviceInterest('apple');
//   /// }
//   /// ```
//   ///
//   /// Throws an [Exception] in case of failure.
//   @override
//   Future<void> addDeviceInterest(String interest) async {
//     await _pusherBeamsApi.addDeviceInterest(interest);
//   }

//   /// Handler which receives callbacks from the native platforms.
//   /// This currently supports [onInterestChanges] and [setUserId] callbacks
//   /// but by default it just call the [Function] set.
//   ///
//   /// **You're not supposed to use this**
//   @override
//   void handleCallback(String callbackId, String callbackName, List args) {
//     final callback = _callbacks[callbackId]!;

//     switch (callbackName) {
//       case "onInterestChanges":
//         callback((args[0] as List<Object?>).cast<String>());
//         return;
//       case "setUserId":
//         callback(args[0] as String?);
//         return;
//       case "onMessageReceivedInTheForeground":
//         callback((args[0] as Map<Object?, Object?>));
//         return;
//       case "onMessageReceivedInTheBackground":
//         callback((args[0] as Map<Object?, Object?>));
//       default:
//         callback();
//         return;
//     }
//   }
// }
