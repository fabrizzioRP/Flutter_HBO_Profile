import 'package:flutter/cupertino.dart';
import 'package:user_app/models/usuario.dart';
import 'package:user_app/utils/gradients_color.dart';

class UsuarioServices extends ChangeNotifier {
  List<Usuario> profile = [
    Usuario(
      name: 'fabrizzio',
      image: '',
      background: GradientColors.secondColorsGradient,
    ),
  ];

  Gradient _colorDefault = GradientColors.firstColorsGradient;

  Gradient get colorDefault => _colorDefault;

  set colorDefault(Gradient gradiente) {
    _colorDefault = gradiente;
    notifyListeners();
  }

  void guardarProfile(Usuario user) {
    profile.add(user);
    notifyListeners();
  }

  background({Gradient? background, String? username = 'no-name'}) {
    Gradient valor = GradientColors.firstColorsGradient;
    for (var usuario in profile) {
      if (usuario.name == username) {
        usuario.background = background;
        valor = usuario.background!;
        break;
      }
    }
    _colorDefault = valor;
    notifyListeners();
  }

  changeImage(String url, String user) {
    for (var usuario in profile) {
      if (usuario.name == user) {
        usuario.image = url;
        break;
      }
    }
    notifyListeners();
  }
}
