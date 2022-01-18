// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/models/usuario.dart';
import 'package:user_app/utils/gradients_color.dart';
import 'package:user_app/services/usuario_services.dart';
import 'package:user_app/widgets/custom_background.dart';
import 'package:user_app/widgets/custom_buttom_gradient.dart';

class AdministrarScreen extends StatelessWidget {
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
              'Administrar Perfiles',
              style: TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 540,
              width: double.infinity,
              child: profileProvider.profile.isEmpty
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
                            AdminProfile(profileProvider.profile[i]),
                            const SizedBox(height: 10),
                            Text(
                              profileProvider.profile[i].name!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            MyGradientElevatedButtom(
              text: 'LISTO',
              border: 30,
              height: 52,
              witdh: 170,
              color1: Colors.grey.withOpacity(0.6),
              color2: Colors.grey.withOpacity(0.6),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminProfile extends StatelessWidget {
  final Usuario usuario;
  const AdminProfile(this.usuario);
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<UsuarioServices>().colorDefault;
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'editprofile', arguments: usuario),
      child: Container(
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
              color: Colors.grey.withOpacity(0.4),
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                if (usuario.image!.isNotEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(usuario.image!),
                      ),
                    ),
                  ),
                const Center(
                  child: Icon(
                    Icons.mode_edit_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
