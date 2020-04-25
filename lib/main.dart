import 'package:flutter/material.dart';

import 'app/landing_page.dart';
import 'services/auth.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
