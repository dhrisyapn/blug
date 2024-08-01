import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  bool visible1 = false;
  var eyeicon1 = const Icon(Icons.visibility_off);
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
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
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
                    'Full Name',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Your splendid name here ',
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
                    'New Password',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Secret here',
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
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Re-type Password',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Secret again here',
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
                          onPressed: toggleicon1,
                          icon: eyeicon1,
                          color: Color(0xff525FE1)),
                    ),
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 17,
                    ),
                    cursorColor: Color(0xFF525FE1),
                    obscureText: visible1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
