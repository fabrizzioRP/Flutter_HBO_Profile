// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:user_app/utils/gradients_color.dart';
import 'package:user_app/widgets/custom_background.dart';
import 'package:user_app/widgets/custom_buttom_gradient.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(
                'Editar perfil',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 30),
              Stack(
                children: [
                  const SizedBox(height: 240, width: 250),
                  Positioned(
                    top: 0,
                    left: 25,
                    child: _ProfilePhoto(),
                  ),
                  Positioned(
                    top: 175,
                    left: 100,
                    child: _ButtonCameraPhoto(),
                  ),
                ],
              ),
              _SelectedColor(),
              _FieldNameUser(),
              const SizedBox(height: 50),
              _ButtomCancelarGuardar()
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: GradientColors.secondColorsGradient,
      ),
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.2),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.person_outline,
          size: 150,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ButtonCameraPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isDismissible: false,
          context: context,
          builder: (_) {
            return Container(
              color: Colors.deepPurple.shade900,
              height: 300,
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    trailing: IconButton(
                      icon: Text(
                        'X',
                        style: TextStyle(color: primaryColor, fontSize: 25),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('tomar foto');
                    },
                    child: Text(
                      'Tomar una foto',
                      style: TextStyle(color: primaryColor, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Subir desde el dispositivo');
                    },
                    child: Text(
                      'Subir desde el dispositivo',
                      style: TextStyle(color: primaryColor, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, 'choosepersonaje'),
                    child: Text(
                      'Elige un personje',
                      style: TextStyle(color: primaryColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.purple,
        ),
      ),
    );
  }
}

class _SelectedColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, i) {
          return Container(
            margin: const EdgeInsets.all(15.0),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              gradient: GradientColors.secondColorsGradient,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}

class _FieldNameUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      width: double.infinity,
      height: 100,
      alignment: Alignment.center,
      child: const TextField(
        cursorColor: Colors.pink,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusColor: Colors.red,
          labelText: 'Nombre',
          labelStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class _ButtomCancelarGuardar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyGradientElevatedButtom(
          text: 'CANCELAR',
          onPressed: () {},
          height: 50,
          color1: Colors.grey.withOpacity(0.6),
          color2: Colors.grey.withOpacity(0.6),
        ),
        MyGradientElevatedButtom(
          text: 'GUARDAR',
          onPressed: () {},
          height: 50,
          color1: Colors.deepPurple,
          color2: Colors.purple.shade300,
        ),
      ],
    );
  }
}
