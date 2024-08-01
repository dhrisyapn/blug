import 'package:blug/forgotpage.dart';
import 'package:blug/getstarted.dart';
import 'package:blug/home.dart';
import 'package:blug/login.dart';
import 'package:blug/post.dart';
import 'package:blug/profile.dart';
import 'package:blug/signup.dart';
import 'package:blug/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: LoginPage());
  }
}
