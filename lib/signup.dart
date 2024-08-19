// ignore_for_file: use_build_context_synchronously

import 'package:blug/username.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  bool visible1 = true;
  var eyeicon1 = const Icon(Icons.visibility);
  void toggleicon1() {
    setState(() {
      visible1 = !visible1;
      if (!visible1) {
        eyeicon1 = const Icon(Icons.visibility);
      } else {
        eyeicon1 = const Icon(Icons.visibility_off);
      }
    });
  }

  TextEditingController fullname = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypepasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Sign up function
  Future<void> signUpWithEmailPassword() async {
    if (passwordController.text != retypepasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Check if sign up was successful
      if (userCredential.user != null) {
        //save name to collction userdata doc email to firestore
        await FirebaseFirestore.instance
            .collection('userdata')
            .doc(emailController.text)
            .set({
          'name': fullname.text,
          'pprofile': '',
        });

        // Navigate to your target page if sign up is successful
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UsernamePage()));
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  void validateAndSignUp() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        retypepasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    if (passwordController.text != retypepasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    signUpWithEmailPassword();
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
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset('assets/Group 12.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Create account!',
                style: TextStyle(
                  color: Color(0xFFFF6B00),
                  fontSize: 45,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.w600,
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
                    controller: emailController,
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
                    'Full Name',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    controller: fullname,
                    decoration: InputDecoration(
                      hintText: 'Your splendid name here ',
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
                    'New Password',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Secret here',
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
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Re-type Password',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    controller: retypepasswordController,
                    decoration: InputDecoration(
                      hintText: 'Secret again here',
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
                          onPressed: toggleicon1,
                          icon: eyeicon1,
                          color: const Color(0xff525FE1)),
                    ),
                    style: const TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 17,
                    ),
                    cursorColor: const Color(0xFF525FE1),
                    obscureText: visible1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      validateAndSignUp();
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
                          'Create account',
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
