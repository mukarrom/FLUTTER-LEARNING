import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

ValueNotifier<AuthServices> authServices = ValueNotifier(AuthServices());

class AuthServices {
  final Logger logger = Logger();
  // create instance of firebase auth
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // get current user details
  User? get currentUser => firebaseAuth.currentUser;

  // auth change user stream
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      logger.d('Error on sign in: $e', stackTrace: StackTrace.current);
      return null;
    }
  }

  // sign up with email and password
  Future<UserCredential>? registerWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // reset password
  Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // update user name
  Future<void> updateUserName(String userName) async {
    await currentUser?.updateDisplayName(userName);
  }

  // delete account
  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    // create credential
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    // verify credential
    await currentUser?.reauthenticateWithCredential(credential);
    // delete account
    await currentUser?.delete();
    // sign out
    await firebaseAuth.signOut();
  }

  // reset the password from current password
  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    // create credential
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    // verify credential
    await currentUser?.reauthenticateWithCredential(credential);
    // update password
    await currentUser?.updatePassword(newPassword);
  }
}
