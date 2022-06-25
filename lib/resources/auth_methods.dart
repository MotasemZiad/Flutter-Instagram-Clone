import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        String imageUrl = await StorageMethods().uploadImage('profile', image);

        await _firestore.collection('users').doc(credential.user!.uid).set({
          'id': credential.user!.uid,
          'username': username,
          'email': email,
          'bio': bio,
          'image': imageUrl,
          'followers': [],
          'following': [],
        });

        res = 'Success';
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
}
