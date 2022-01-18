// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:user_app/utils/gradients_color.dart';
import 'package:user_app/widgets/custom_background.dart';
import 'package:user_app/widgets/custom_buttom_gradient.dart';

class InicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (_, i) => Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Profile(),
                      const SizedBox(height: 10),
                      const Text('Fabrizzio',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300)),
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
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                MyGradientElevatedButtom(
                  text: '+  NIÑO',
                  border: 30,
                  height: 52,
                  witdh: 170,
                  color1: Colors.grey.withOpacity(0.6),
                  color2: Colors.grey.withOpacity(0.6),
                  onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: GradientColors.secondColorsGradient,
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
          // aca hacer condicion de eso o foto
          child: const Text('F',
              style: TextStyle(fontSize: 40, color: Colors.white)),
        ),
      ),
    );
  }
}
