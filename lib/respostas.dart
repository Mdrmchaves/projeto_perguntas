import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String _texto;
  final void Function()? onPress;

  Resposta(this._texto, {this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(_texto),
        onPressed: onPress,
      ),
    );
  }
}
