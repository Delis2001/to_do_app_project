// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/forget_password/reset_new_password_screen.dart';
import 'package:to_do_app/screens/home_section/bottom_nav.dart';
import 'package:to_do_app/screens/home_section/empty_note_home_screen.dart';
import 'package:to_do_app/screens/intro/intro_screen.dart';
import 'package:to_do_app/screens/forget_password/reset_password.dart';
import 'package:to_do_app/screens/login/login_screen.dart';
import 'package:to_do_app/screens/posts_and_edith_to_do/create_notes_screen.dart';
import 'package:to_do_app/screens/posts_and_edith_to_do/create_to_do_screen.dart';
import 'package:to_do_app/screens/registeration/register_screen.dart';
import 'package:to_do_app/screens/unboarding/start_screen.dart';
import 'package:to_do_app/screens/unboarding/unboarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: IntroScreen()  ),
    );
  }
}
