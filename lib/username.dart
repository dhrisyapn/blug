import 'package:flutter/material.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Image.asset('assets/Group 12.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Choose an \nincredible  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                      height: 0.20,
                    ),
                  ),
                  TextSpan(
                    text: 'username',
                    style: TextStyle(
                      color: Color(0xFFFF6B00),
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' \nfor your account.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                      height: 0.20,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'choose a username',
                      hintStyle: TextStyle(
                        color: Color(0x7F525FE1),
                        fontFamily: 'Alumni Sans',
                        fontWeight: FontWeight.w100,
                        fontSize: 18,
                      ),
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
                    textAlign:
                        TextAlign.center, // Align the hint text at the center
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
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Alumni Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
