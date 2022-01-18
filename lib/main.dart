// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'screens/administrar_screen.dart';
import 'widgets/custom_personajes_choose.dart';
import 'package:user_app/screens/edit_profile.dart';
import 'package:user_app/screens/inicio_screen.dart';
import 'package:user_app/services/usuario_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: {
          '/': (_) => InicioScreen(),
          'administrar': (_) => AdministrarScreen(),
          'editprofile': (_) => EditProfileScreen(),
          'choosepersonaje': (_) => ChoosePersonajeCustom(),
        },
      ),
    );
  }
}
