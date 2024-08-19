import 'package:blug/signin.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/Group 21.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/Group 3.png')),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don \'t just think it,\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontFamily: 'Alumni Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'BLUG it!',
                        style: TextStyle(
                          color: Color(0xFFFF6B00),
                          fontSize: 45,
                          fontFamily: 'Alumni Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135,
                    height: 1,
                    decoration: const BoxDecoration(color: Color(0xFF525FE1)),
                  ),
                  Container(
                    width: 135,
                    height: 1,
                    decoration: const BoxDecoration(color: Color(0xFFFF6B00)),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 60),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninPage()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFFF6B00)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Image.asset('assets/mail.png'),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Continue with Email',
                            style: TextStyle(
                              color: Color(0xFFFF6B00),
                              fontSize: 25,
                              fontFamily: 'Alumni Sans',
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
