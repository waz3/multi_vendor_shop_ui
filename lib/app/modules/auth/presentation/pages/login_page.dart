import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/configs/core_config.dart';
import '../../../../core/consts/color.dart';
import '../../../../core/consts/img.dart';

class LoginPage extends StatelessWidget {
  Container _buildContentContainer(BuildContext context) {
    return Container(
      width: getWidth(context),
      height: getHeight(context),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(LOGIN_WALLPAPER)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        child: _buildContent(context),
      ),
    );
  }

  final Text _wellcome = Text(
    'Bem-Vindo',
    style: TextStyle(
        color: PRIMARY_COLOR,
        fontSize: 42,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
  );

  final Text _wellcomeText = Text(
    'Ao seu supermercado \nVirtual',
    style: TextStyle(
      color: Colors.black45,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget _buildCustomButton(String text, Color backgroundColor,
      {BuildContext context,
      Color textColor,
      double elevation,
      VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: getWidth(context),
        height: 50,
        child: RaisedButton(
          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
          color: backgroundColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Column _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(LOGO_NAMED),
        SizedBox(height: 20.0),
        _wellcome,
        _wellcomeText,
        Expanded(child: SizedBox()),
        _buildCustomButton(
          'Registar',
          Theme.of(context).cardColor,
          context: context,
          onPressed: () => Modular.to.pushNamed('/auth/signup'),
        ),
        SizedBox(height: 20.0),
        _buildCustomButton('Entrar', Colors.black26,
            elevation: 0.0,
            textColor: Theme.of(context).cardColor,
            context: context,
            onPressed: () =>
                Modular.to.pushNamedAndRemoveUntil('/', (_) => false)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _buildContentContainer(context)),
    );
  }
}
