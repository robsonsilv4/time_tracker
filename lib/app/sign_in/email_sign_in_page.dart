import 'package:flutter/material.dart';

import '../../services/auth.dart';
import 'email_sign_in_form.dart';

class EmailSignInPage extends StatelessWidget {
  final AuthBase auth;

  EmailSignInPage({this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return EmailSignInForm(auth: auth);
  }
}
