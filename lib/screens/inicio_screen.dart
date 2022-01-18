// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/models/usuario.dart';
import 'package:user_app/utils/custom_dialog.dart';
import 'package:user_app/utils/gradients_color.dart';
import 'package:user_app/services/usuario_services.dart';
import 'package:user_app/widgets/custom_background.dart';
import 'package:user_app/widgets/custom_buttom_gradient.dart';

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profileProvider = context.watch<UsuarioServices>();
    return Scaffold(
      body: CustomBackground(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.2),
            Text(
              '¿Quién esta viendo?',
              style: TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 470,
              width: double.infinity,
              child: (profileProvider.profile.isEmpty)
                  ? const Center(child: Text('No existe Usuario'))
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 3,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: profileProvider.profile.length,
                      itemBuilder: (_, i) => Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Profile(profileProvider.profile[i]),
                            const SizedBox(height: 10),
                            Text(
                              profileProvider.profile[i].name!,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyGradientElevatedButtom(
                  text: '+  ADULTO',
                  border: 30,
                  height: 52,
                  witdh: 170,
                  color1: Colors.grey.withOpacity(0.6),
                  color2: Colors.grey.withOpacity(0.6),
                  onPressed: (profileProvider.profile.length == 4)
                      ? () {
                          showAlert(context, 'IMPOSIBLE DE AGREGAR UN USUARIO',
                              'En esta cuenta solo se puede agregar maximo 4 perfiles.');
                        }
                      : () {
                          final newUser = Usuario(
                            name:
                                'adulto ${profileProvider.profile.length + 1}',
                            image: '',
                            background: profileProvider.colorDefault,
                          );
                          profileProvider.guardarProfile(newUser);
                        },
                ),
                const SizedBox(width: 10),
                MyGradientElevatedButtom(
                  text: '+  NIÑO',
                  border: 30,
                  height: 52,
                  witdh: 170,
                  color1: Colors.grey.withOpacity(0.6),
                  color2: Colors.grey.withOpacity(0.6),
                  onPressed: (profileProvider.profile.length == 4)
                      ? () {
                          showAlert(context, 'IMPOSIBLE DE AGREGAR UN USUARIO',
                              'En esta cuenta solo se puede agregar maximo 4 perfiles.');
                        }
                      : () {
                          final newUser = Usuario(
                            name: 'niño ${profileProvider.profile.length + 1}',
                            image: '',
                            background: profileProvider.colorDefault,
                          );
                          profileProvider.guardarProfile(newUser);
                        },
                ),
              ],
            ),
            const SizedBox(height: 25),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: const Text(
                'ADMINISTRAR PERFILES',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () => Navigator.pushNamed(context, 'administrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final Usuario user;
  const Profile(this.user);
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UsuarioServices>().colorDefault;
    return Container(
      height: 150,
      width: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: profileProvider,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.2),
          ),
          alignment: Alignment.center,
          child: (user.image!.isEmpty)
              ? Text(user.name!.substring(0, 1).toUpperCase(),
                  style: const TextStyle(fontSize: 40, color: Colors.white))
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(user.image!),
                  ),
                ),
        ),
      ),
    );
  }
}
