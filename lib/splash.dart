import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset('assets/Group 61.png'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Text(
              'BLUG',
              style: TextStyle(
                color: Color(0xFF525FE1),
                fontSize: 36,
                fontFamily: 'Alumni Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
