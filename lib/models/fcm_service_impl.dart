import 'package:firebase_messaging/firebase_messaging.dart';

class FCMServiceImpl {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  @override
  Future<void> init() async {
    await _fcm.requestPermission();
    getDeviceToken();
    onMessageTapped();
    onMessageReceived();
    _firebaseMessagingBackgroundHandler;
  //  onBackgroundMessageReceived();
  }

// Get deviceToken
  void getDeviceToken() async {
   // final deviceToken = await _fcm.getToken();
   // print("Device Token : $deviceToken");
  }

// App is open
  void onMessageReceived() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
    });
  }

// Message clicked
  void onMessageTapped() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
      // when Clike the Message Navigat to  =>
    });
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.data}");
  }

// BackgroundMessage
  Future<void> onBackgroundMessageReceived() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
