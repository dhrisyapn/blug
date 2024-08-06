import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final email = FirebaseAuth.instance.currentUser!.email;
  TextEditingController descriptionController = TextEditingController();
  Future<void> savePost() async {
    String? name;
    String? username;
    if (email != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('userdata')
          .doc(email)
          .get();

      if (doc.exists) {
        setState(() {
          name = doc['name'];
          username = doc['username'];
        });
        //save username ,name, corrent timestamp, description to collection post
        String description = descriptionController.text.trim();
        if (description.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Description cannot be empty')),
          );
          return;
        }
        await FirebaseFirestore.instance.collection('posts').add({
          'name': name,
          'username': username,
          'description': description,
          'timestamp': FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Post saved successfully')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User data not found')),
        );
      }
    }
  }

  File? _image;
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
                  _image == null
                      ? Image.asset('assets/image.png')
                      : Image.file(_image!),
                  SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child: Text(
                      'Add image',
                      style: TextStyle(
                        fontFamily: 'Alumni Sans',
                        fontWeight: FontWeight.w300,
                      ),
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
              controller: descriptionController,
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
            child: GestureDetector(
              onTap: () {
                savePost();
              },
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
            ),
          )
        ],
      ),
    );
  }
}
