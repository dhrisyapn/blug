// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    String? profilePic;

    try {
      // Upload image to Firebase Storage
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      // Use the downloadURL as needed

      if (email != null) {
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('userdata')
            .doc(email)
            .get();

        if (doc.exists) {
          setState(() {
            name = doc['name'];
            username = doc['username'];
            profilePic = doc['profile'];
          });
          //save username ,name, corrent timestamp, description to collection post
          String description = descriptionController.text.trim();

          await FirebaseFirestore.instance.collection('posts').add({
            'name': name,
            'username': username,
            'description': description,
            'timestamp': FieldValue.serverTimestamp(),
            'image': downloadURL,
            'profile': profilePic,
          });
          //pop
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Post saved successfully')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User data not found')),
          );
        }
      }
    } on FirebaseException catch (e) {
      // Handle Firebase specific exceptions
      if (e.code == 'canceled') {
        print('Upload was canceled');
      } else {
        print('FirebaseException: ${e.message}');
      }
    } catch (e) {
      // Handle any other exceptions
      print('An unknown error occurred: $e');
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
        title: Image.asset(
          'assets/Group 3.png',
          height: 25,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
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
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: _image == null
                      ? Container(
                          width: double.infinity,
                          height: 120,
                          decoration: ShapeDecoration(
                            color: const Color(0x33525FE1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Add image',
                                style: TextStyle(
                                  fontFamily: 'Alumni Sans',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                )),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Write something awesome...',
                  hintStyle: const TextStyle(
                      color: Color(0x7F525FE1),
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w100,
                      fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF525FE1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF525FE1)),
                  ),
                ),
                style: const TextStyle(
                  color: Color(0xFF525FE1),
                  fontSize: 17,
                ),
                cursorColor: const Color(0xFF525FE1),
                maxLines: 5, // Allow up to 5 lines of input
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: GestureDetector(
                onTap: () {
                  if (_image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select an image')),
                    );
                  } else if (descriptionController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a description')),
                    );
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Dialog(
                          backgroundColor: Colors.transparent,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                    savePost();
                  }
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
      ),
    );
  }
}
