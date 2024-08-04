import 'package:blug/post.dart';
import 'package:blug/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget postcard() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Container(
        width: double.infinity,
        height: 208,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F525FE1),
              blurRadius: 27,
              offset: Offset(0, 0),
              spreadRadius: -10,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/round.png'),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dhrisya P N',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Alumni Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '@dhrisyapn',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFF6B00),
                              fontSize: 13,
                              fontFamily: 'Alumni Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Image.asset('assets/like.png'),
                        Text(
                          '96 likes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Alumni Sans',
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'The post will have a long description user shared. The post will have a long descrip......',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 95,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },

              // Replace the Image.asset with an Icon
              child: Icon(
                Icons.account_circle, // Profile icon from the Icons class
                size: 40.0, // Set the size of the icon
                color: Color(0xff525FE1), // Set the color of the icon
              ),
            ),
          )
        ],
        title: Center(
          child: Image.asset(
            'assets/Group 3.png',
            height: 40,
          ),
        ),
        backgroundColor:
            Colors.transparent, // Set background color to transparent
        elevation: 0, // Optionally remove the shadow
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10, right: 10),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PostPage()));
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: const ShapeDecoration(
                color: Color(0xFFFF6B00),
                shape: OvalBorder(),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Home',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF525FE1),
                fontSize: 25,
                fontFamily: 'Alumni Sans',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          postcard(),
          postcard(),
        ],
      ),
    );
  }
}
