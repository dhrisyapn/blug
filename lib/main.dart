import 'package:blug/firebase_options.dart';
import 'package:blug/forgotpage.dart';
import 'package:blug/getstarted.dart';
import 'package:blug/home.dart';
import 'package:blug/providerclass.dart';
import 'package:blug/signin.dart';
import 'package:blug/post.dart';
import 'package:blug/profile.dart';
import 'package:blug/signup.dart';
import 'package:blug/splash.dart';
import 'package:blug/username.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff87CEFA),
            useMaterial3: true,
          ),
          home: SplashScreen()),
    );
  }
}
