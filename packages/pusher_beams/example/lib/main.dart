import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pusher_beams/pusher_beams_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PusherBeamsPlugin.instance.start('bd2c91e4-4250-4870-85f7-ff6da00add64');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pusher Beams Flutter Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Pusher Beams Flutter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();

    initPusherBeams();
  }

  getSecure() async {
    // final BeamsAuthProvider provider = BeamsAuthProvider()
    //   ..authUrl = 'https://some-auth-url.com/secure'
    //   ..headers = {'Content-Type': 'application/json'}
    //   ..queryParams = {'page': '1'}
    //   ..credentials = 'omit';

    // await PusherBeamsPlugin.instance.setUserId(
    //     'user-id',
    //     provider,
    //     (error) => {
    //           if (error != null) {print(error)}

    //           // Success! Do something...
    //         });
  }

  initPusherBeams() async {
    // Let's see our current interests
    // print(await PusherBeamsPlugin.instance.getDeviceInterests());

    // This is not intented to use in web
    // if (!kIsWeb) {
    await PusherBeamsPlugin.instance.setDeviceInterests(['debug-teste']);

    // await PusherBeamsPlugin.instance.onInterestChanges((interests) => {print('Interests: $interests')});

    await PusherBeamsPlugin.instance.onMessageReceivedInTheForeground(_onMessageReceivedInTheForeground);
    await PusherBeamsPlugin.instance.onMessageReceivedInTheBackground(_onMessageReceivedInTheBackground);
    // }
    // await _checkForInitialMessage();
  }

  // Future<void> _checkForInitialMessage() async {
  //   final initialMessage = await PusherBeamsPlugin.instance.getInitialMessage();
  //   if (initialMessage != null) {
  //     _showAlert('Initial Message Is:', initialMessage.toString());
  //   }
  // }

  void _onMessageReceivedInTheForeground(Map<Object?, Object?> data) {
    _showAlert(data["title"].toString(), data["body"].toString());
  }

  void _onMessageReceivedInTheBackground(Map<Object?, Object?> data) {
    _showAlert(data["title"].toString(), data["body"].toString());
  }

  void _showAlert(String title, String message) {
    AlertDialog alert = AlertDialog(title: Text(title), content: Text(message), actions: const []);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
                onPressed: () async {
                  // await PusherBeamsPlugin.instance.addDeviceInterest('bananas');
                },
                child: const Text('I like bananas')),
            OutlinedButton(
                onPressed: () async {
                  // await PusherBeamsPlugin.instance.removeDeviceInterest('bananas');
                },
                child: const Text("I don't like banana anymore")),
            OutlinedButton(
                onPressed: () async {
                  // await PusherBeamsPlugin.instance.addDeviceInterest('apples');
                },
                child: const Text('I like apples')),
            OutlinedButton(
                onPressed: () async {
                  // await PusherBeamsPlugin.instance.addDeviceInterest('garlic');
                },
                child: const Text('I like garlic')),
            OutlinedButton(onPressed: getSecure, child: const Text('Get Secure')),
            OutlinedButton(
                onPressed: () async {
                  await PusherBeamsPlugin.instance.clearDeviceInterests();
                },
                child: const Text('Clear my interests'))
          ],
        ),
      ),
    );
  }
}
