import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../services/auth.dart';
import 'email_sign_in_model.dart';

class EmailSigInBloc {
  final AuthBase auth;
  final _modelController = StreamController<EmailSignInModel>();
  EmailSignInModel _model = EmailSignInModel();

  EmailSigInBloc({@required this.auth});

  Stream<EmailSignInModel> get modelStream => _modelController.stream;

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      submiited: submitted,
    );
    _modelController.add(_model);
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void toggleFormType() {
    final formType = _model.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (_model.formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(
          _model.email,
          _model.password,
        );
      } else {
        await auth.createUserWithEmailAndPassword(
          _model.email,
          _model.password,
        );
      }
    } catch (error) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void dispose() {
    _modelController.close();
  }
}
