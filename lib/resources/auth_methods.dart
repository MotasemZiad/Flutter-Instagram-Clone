import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:instagram_clone/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String name = 'Ahmed',
      email = 'ahmed@gmail.com',
      biography = 'I learn so I exist';

  Future<String> registerUser({
    required String username,
    required String email,
    required String password,
    required String bio,
    Uint8List? image,
  }) async {
    String res = "Something went wrong!";

    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          bio.isNotEmpty &&
          image != null) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String imageUrl = await StorageMethods().uploadImage('profile', image);

        User user = User(
          id: credential.user!.uid,
          username: username,
          email: email,
          bio: bio,
          image: imageUrl,
          followers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());

        // 1. You can use log to print any useful information
        log("User id: ${credential.user!.uid}\n Image URL: $imageUrl\n");
        // 2. You still can use print but in the debug mode
        if (kDebugMode) {
          print("User Email: ${credential.user!.email}");
        }

        res = 'Success';
      } else {
        res = 'Please fill fields';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        res = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        res = 'The email you used is invalid';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Something went wrong!";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'Success';
      } else {
        res = 'Please fill fields';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        res = 'Wrong password provided for that user';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
