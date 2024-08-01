import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _LoginPageState();
}

class _LoginPageState extends State<Signin> {
  bool visible = false;
  var eyeicon = const Icon(Icons.visibility_off);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Image.asset('assets/Group 12.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
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
                  Text(
                    'Email address',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Your awesome email here',
                      hintStyle: TextStyle(
                          color: Color(0x7F525FE1),
                          fontFamily: 'Alumni Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF525FE1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF525FE1)),
                      ),
                    ),
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 17,
                    ),
                    cursorColor: Color(0xFF525FE1),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Our secret here',
                      hintStyle: TextStyle(
                          color: Color(0x7F525FE1),
                          fontFamily: 'Alumni Sans',
                          fontWeight: FontWeight.w100,
                          fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF525FE1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF525FE1)),
                      ),
                      suffixIcon: IconButton(
                          onPressed: toggleicon,
                          icon: eyeicon,
                          color: Color(0xff525FE1)),
                    ),
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 17,
                    ),
                    cursorColor: Color(0xFF525FE1),
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
                  Text(
                    'Forgot secret?',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 20,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: ShapeDecoration(
                  color: Color(0xFFFF6B00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
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
            SizedBox(
              height: 30,
            ),
            Center(
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
              child: Text(
                'Let’s get one new here',
                style: TextStyle(
                  color: Color(0xFFFF6B00),
                  fontSize: 22,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
