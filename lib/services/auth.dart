import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  final String uid;

  User({@required this.uid});
}

abstract class AutBase {
  Future<User> currentUser();

  Future<User> signInAnonymous();

  Future<void> signOut();
}

class Auth implements AutBase {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  @override
  Future<User> signInAnonymous() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
