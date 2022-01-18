// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_app/models/pictures.dart';
import 'package:user_app/utils/gradients_color.dart';

class ChoosePersonajeCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: GradientColors.firstColorsGradient,
        ),
        child: Column(
          children: [
            _CustomAppBar(),
            SizedBox(
              height: size.height * 0.85,
              width: size.width,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 140,
                  childAspectRatio: 3 / 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: personajes.length,
                itemBuilder: (_, i) => _PicturePersonaje(personajes[i]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: primaryColor),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 20),
          Text(
            'Elige un Personaje',
            style: TextStyle(
                color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 70),
        ],
      ),
    );
  }
}

class _PicturePersonaje extends StatelessWidget {
  final PersonajesProfile personaje;
  const _PicturePersonaje(this.personaje);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(personaje.url),
      ),
    );
  }
}
