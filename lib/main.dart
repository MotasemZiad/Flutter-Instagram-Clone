import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_layout_screen.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_layout_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBhnmKgAC5Hpeb4MWmxmCOFWvGdhLqCD7U',
        appId: '1:552423509045:web:ed6654e661aac01216757c',
        messagingSenderId: '552423509045',
        projectId: 'instagram-clone-7c365',
        storageBucket: 'instagram-clone-7c365.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  ErrorWidget.builder = (details) {
    return Material(
      child: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              details.exception.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const ResponsiveLayoutScreen(
                  mobileLayoutScreen: MobileLayoutScreen(),
                  webLayoutScreen: WebLayoutScreen());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong\n${snapshot.error}'),
              );
            }
          }

          return const LoginScreen();
        },
      ),
    );
  }
}
