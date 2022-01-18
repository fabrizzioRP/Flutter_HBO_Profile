// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/services/usuario_services.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = context.watch<UsuarioServices>().colorDefault;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(gradient: usuarioProvider),
      child: Stack(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/hbo.png', width: 100),
                const SizedBox(width: 5),
                Image.asset(
                  'assets/logo/max.png',
                  width: 75,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
