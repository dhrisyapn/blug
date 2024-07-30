import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Create new post',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF525FE1),
                fontSize: 25,
                fontFamily: 'Alumni Sans',
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: ShapeDecoration(
                color: Color(0x33525FE1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/image.png'),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Add image',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 13,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Write something awesome...',
                hintStyle: TextStyle(
                    color: Color(0x7F525FE1),
                    fontFamily: 'Alumni Sans',
                    fontWeight: FontWeight.w100,
                    fontSize: 18),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1, color: Color(0xFF525FE1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1, color: Color(0xFF525FE1)),
                ),
              ),
              style: TextStyle(
                color: Color(0xFF525FE1),
                fontSize: 17,
              ),
              cursorColor: Color(0xFF525FE1),
              maxLines: 5, // Allow up to 5 lines of input
            ),
          ),
          SizedBox(
            height: 25,
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
                  'Post',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Alumni Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
