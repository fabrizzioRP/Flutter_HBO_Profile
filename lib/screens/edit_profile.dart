// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/models/usuario.dart';
import 'package:user_app/services/usuario_services.dart';
import 'package:user_app/utils/gradients_color.dart';
import 'package:user_app/widgets/custom_background.dart';
import 'package:user_app/widgets/custom_buttom_gradient.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuario = ModalRoute.of(context)!.settings.arguments as Usuario;
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
                    child: _ProfilePhoto(usuario),
                  ),
                  Positioned(
                    top: 175,
                    left: 100,
                    child: _ButtonCameraPhoto(usuario),
                  ),
                ],
              ),
              _SelectedColor(usuario),
              _FieldNameUser(usuario),
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
  const _ProfilePhoto(this.usuario);
  final Usuario usuario;
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UsuarioServices>().colorDefault;
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: profileProvider,
      ),
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.2),
        ),
        alignment: Alignment.center,
        child: (usuario.image!.isEmpty)
            ? const Icon(
                Icons.person_outline,
                size: 150,
                color: Colors.white,
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(usuario.image!),
                ),
              ),
      ),
    );
  }
}

class _ButtonCameraPhoto extends StatelessWidget {
  const _ButtonCameraPhoto(this.usuario);
  final Usuario usuario;
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
                    onTap: () => Navigator.pushNamed(context, 'choosepersonaje',
                        arguments: usuario),
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
  const _SelectedColor(this.usuario);
  final Usuario usuario;
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = context.watch<UsuarioServices>();
    return Container(
      height: 80,
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: coloresBackground.length,
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () {
              usuarioProvider.background(
                background: coloresBackground[i],
                username: usuario.name!,
              );
            },
            child: Container(
              margin: const EdgeInsets.all(15.0),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                gradient: coloresBackground[i],
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FieldNameUser extends StatelessWidget {
  const _FieldNameUser(this.usuario);
  final Usuario usuario;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      width: double.infinity,
      height: 100,
      alignment: Alignment.center,
      child: TextField(
        cursorColor: Colors.pink,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusColor: Colors.red,
          labelText: 'Nombre',
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: usuario.name,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        onSubmitted: (value) => usuario.name = value,
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
          onPressed: () => Navigator.pop(context),
          height: 50,
          color1: Colors.grey.withOpacity(0.6),
          color2: Colors.grey.withOpacity(0.6),
        ),
        MyGradientElevatedButtom(
          text: 'GUARDAR',
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          height: 50,
          color1: Colors.deepPurple,
          color2: Colors.purple.shade300,
        ),
      ],
    );
  }
}
