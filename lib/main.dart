// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
//
import 'screens/administrar_screen.dart';
import 'package:user_app/screens/inicio_screen.dart';
import 'package:user_app/screens/edit_profile.dart';

import 'widgets/custom_personajes_choose.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (_) => InicioScreen(),
        'administrar': (_) => AdministrarScreen(),
        'editprofile': (_) => EditProfileScreen(),
        'choosepersonaje': (_) => ChoosePersonajeCustom(),
      },
    );
  }
}
