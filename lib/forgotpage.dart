import 'package:flutter/material.dart';

class ForgotPaasswordPage extends StatefulWidget {
  const ForgotPaasswordPage({super.key});

  @override
  State<ForgotPaasswordPage> createState() => _ForgotPaasswordPageState();
}

class _ForgotPaasswordPageState extends State<ForgotPaasswordPage> {
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
            const SizedBox(
              height: 60,
            ),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Get a link to reset \nour ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'secret',
                    style: TextStyle(
                      color: Color(0xFFFF6B00),
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' into \nyour ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'mail',
                    style: TextStyle(
                      color: Color(0xFFFF6B00),
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' box!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 60),
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
                    height: 20,
                  ),
                  Container(
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
                        'Get Link',
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
            ),
          ],
        ),
      ),
    );
  }
}
