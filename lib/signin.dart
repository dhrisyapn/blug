// ignore_for_file: camel_case_types, avoid_print, use_build_context_synchronously

import 'package:blug/forgotpage.dart';
import 'package:blug/home.dart';
import 'package:blug/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _signinPageState();
}

class _signinPageState extends State<SigninPage> {
  bool visible = true;
  var eyeicon = const Icon(Icons.visibility);
  void toggleicon() {
    setState(() {
      visible = !visible;
      if (!visible) {
        eyeicon = const Icon(Icons.visibility);
      } else {
        eyeicon = const Icon(Icons.visibility_off);
      }
    });
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in function
  Future<void> signInWithEmailPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      // Check if sign in was successful
      if (userCredential.user != null) {
        // Navigate to your target page if login is successful
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>

                    // Change this to the page you want to navigate to after login
                    const HomePage()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Image.asset('assets/Group 12.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Sign in!',
                style: TextStyle(
                  color: Color(0xFFFF6B00),
                  fontSize: 45,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email address',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'Your awesome email here',
                      hintStyle: const TextStyle(
                          color: Color(0x7F525FE1),
                          fontFamily: 'Alumni Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFF525FE1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFF525FE1)),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 17,
                    ),
                    cursorColor: const Color(0xFF525FE1),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      hintText: 'Our secret here',
                      hintStyle: const TextStyle(
                          color: Color(0x7F525FE1),
                          fontFamily: 'Alumni Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFF525FE1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xFF525FE1)),
                      ),
                      suffixIcon: IconButton(
                          onPressed: toggleicon,
                          icon: eyeicon,
                          color: const Color(0xff525FE1)),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 17,
                    ),
                    cursorColor: const Color(0xFF525FE1),
                    obscureText: visible,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPaasswordPage()));
                    },
                    child: const Text(
                      'Forgot secret?',
                      style: TextStyle(
                        color: Color(0xFF525FE1),
                        fontSize: 20,
                        fontFamily: 'Alumni Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: GestureDetector(
                onTap: () {
                  signInWithEmailPassword();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF6B00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Get in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Alumni Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Doesn’t have an account?',
                style: TextStyle(
                  color: Color(0xFF525FE1),
                  fontSize: 18,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const Text(
                  'Let’s get one new here',
                  style: TextStyle(
                    color: Color(0xFFFF6B00),
                    fontSize: 22,
                    fontFamily: 'Alumni Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
