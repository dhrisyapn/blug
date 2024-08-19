// ignore_for_file: use_build_context_synchronously

import 'package:blug/post.dart';
import 'package:blug/profile.dart';
import 'package:blug/providerclass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget postcard(
      String username, String name, String body, String src, String profile) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F525FE1),
              blurRadius: 27,
              offset: Offset(0, 0),
              spreadRadius: -10,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 29,
                            height: 29,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: OvalBorder(),
                            ),
                            child: profile == ''
                                ? const Icon(
                                    Icons.account_circle,
                                    color: Colors.white,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      profile,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Alumni Sans',
                              fontWeight: FontWeight.w300,
                              height: 0.8,
                            ),
                          ),
                          Text(
                            '@$username',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFFFF6B00),
                              fontSize: 13,
                              fontFamily: 'Alumni Sans',
                              fontWeight: FontWeight.w300,
                              height: 0.8,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                body,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 95,
                decoration: ShapeDecoration(
                  color: const Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                margin: const EdgeInsets.only(bottom: 15),
                child: Image.network(src, fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int count = 0;
  void getPostData() {
    setState(() {
      count = 0;
    });
    Provider.of<PostsProvider>(context, listen: false).postdata.clear();

    String username = '';
    //get username of current user from collection userdata doc email
    FirebaseFirestore.instance
        .collection('userdata')
        .doc(email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        username = documentSnapshot['username'];
      } else {}
    });
// get name,username,description from collection posts all documents and save to provider
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc['username'] == username) {
          setState(() {
            count++;
          });
        }
        Provider.of<PostsProvider>(context, listen: false)
            .setCount(count.toString());
        Provider.of<PostsProvider>(context, listen: false).addPost(Posts(
          username: doc['username'],
          name: doc['name'],
          body: doc['description'],
          image: doc['image'],
          profile: doc['profile'],
          timestamp: doc['timestamp'].toDate(),
        ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getPostData();
  }

  String email = FirebaseAuth.instance.currentUser!.email!;
  Future<String> _getProfileUrl() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('userdata')
        .doc(email)
        .get();

    return userDoc['profile'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },

              // Replace the Image.asset with an Icon
              // child: const Icon(
              //   Icons.account_circle, // Profile icon from the Icons class
              //   size: 40.0, // Set the size of the icon
              //   color: Color(0xff525FE1), // Set the color of the icon
              // ),
              child: _getProfileUrl() == ''
                  ? const Icon(
                      Icons.account_circle, // Profile icon from the Icons class
                      size: 40.0, // Set the size of the icon
                      color: Color(0xff525FE1), // Set the color of the icon
                    )
                  : FutureBuilder<String>(
                      future: _getProfileUrl(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              snapshot.data!,
                              fit: BoxFit.cover,
                              width: 35,
                              height: 35,
                            ),
                          );
                        } else {
                          return const Icon(
                            Icons
                                .account_circle, // Profile icon from the Icons class
                            size: 35, // Set the size of the icon
                            color:
                                Color(0xff525FE1), // Set the color of the icon
                          );
                        }
                      },
                    ),
            ),
          )
        ],
        title: Image.asset(
          'assets/Group 3.png',
          height: 25,
        ),
        centerTitle: true,
        backgroundColor:
            Colors.transparent, // Set background color to transparent
        elevation: 0, // Optionally remove the shadow
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PostPage()))
                  .then((value) => getPostData());
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: const ShapeDecoration(
                color: Color(0xFFFF6B00),
                shape: OvalBorder(),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
            )),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getPostData();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'New posts',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF525FE1),
                  fontSize: 25,
                  fontFamily: 'Alumni Sans',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            //call postcard widget for each post in provider
            Expanded(
              child: ListView.builder(
                itemCount: Provider.of<PostsProvider>(context).post.length,
                itemBuilder: (context, index) {
                  return postcard(
                    Provider.of<PostsProvider>(context).post[index].username,
                    Provider.of<PostsProvider>(context).post[index].name,
                    Provider.of<PostsProvider>(context).post[index].body,
                    Provider.of<PostsProvider>(context).post[index].image,
                    Provider.of<PostsProvider>(context).post[index].profile,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
