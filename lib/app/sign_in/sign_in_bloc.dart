import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../services/auth.dart';

class SignInBloc {
  final AuthBase auth;

  SignInBloc({@required this.auth});

  final _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void _setLoading(bool isLoading) => _isLoadingController.add(isLoading);

  void dispose() {
    _isLoadingController.close();
  }

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      _setLoading(true);
      return await signInMethod();
    } catch (error) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<User> signInAnonymously() async => await _signIn(
        auth.signInAnonymously,
      );

  Future<User> signInWithGoogle() async => await _signIn(
        auth.signInWithGoogle,
      );

  Future<User> signInWithFacebook() async => await _signIn(
        auth.signInWithFacebook,
      );
}
