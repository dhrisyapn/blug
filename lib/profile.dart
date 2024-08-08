import 'dart:io';

import 'package:blug/providerclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget postcard(String body, String image) {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '21/07/2053',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Alumni Sans',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '11:11 PM',
                            style: TextStyle(
                              color: Color(0xFFFF6B00),
                              fontSize: 13,
                              fontFamily: 'Alumni Sans',
                              fontWeight: FontWeight.w300,
                              height: 0.06,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                body,
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
                child: Image.network(image, fit: BoxFit.cover),
              )
            ],
          ),
        ),
      ),
    );
  }

  final email = FirebaseAuth.instance.currentUser!.email;

  String? name;
  String? username;
  String? profile;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    if (email != null) {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('userdata')
          .doc(email)
          .get();

      if (doc.exists) {
        setState(() {
          name = doc['name'];
          username = doc['username'];
          profile = doc['profile'];
        });
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
      await _uploadImageAndSaveProfile();
    }
  }

  Future<void> _uploadImageAndSaveProfile() async {
    if (_image == null) return;
    try {
      // Upload image to Firebase Storage
      String fileName =
          'profile_images/${DateTime.now().millisecondsSinceEpoch}.png';
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      // Save profile image URL to Firestore
      await FirebaseFirestore.instance.collection('userdata').doc(email).set({
        'profile': downloadURL,
      }, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile image updated successfully!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile image: $e')));
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: _image == null
                                    ? profile == null
                                        ? Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 35,
                                          )
                                        : Image.network(profile!,
                                            fit: BoxFit.cover)
                                    : Image.file(_image!, fit: BoxFit.cover),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name ?? 'user',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Alumni Sans',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          username ?? 'username',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF6B00),
                            fontSize: 19,
                            fontFamily: 'Alumni Sans',
                            fontWeight: FontWeight.w300,
                            height: 0.04,
                          ),
                        )
                      ],
                    ),

                    // postcard(),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset('assets/settings.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Posts ',
                    style: TextStyle(
                      color: Color(0xFFFF6B00),
                      fontSize: 23,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: '19',
                    style: TextStyle(
                      color: Color(0xFF525FE1),
                      fontSize: 18,
                      fontFamily: 'Alumni Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          //call postcard() function for post with username=username from provider

          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<PostsProvider>(context).post.length,
              itemBuilder: (context, index) {
                if (Provider.of<PostsProvider>(context).post[index].username ==
                    username) {
                  return postcard(
                      Provider.of<PostsProvider>(context).post[index].body,
                      Provider.of<PostsProvider>(context).post[index].image);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
