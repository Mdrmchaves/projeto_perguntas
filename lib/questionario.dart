import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int indexPerguntaAtual;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.indexPerguntaAtual,
    required this.responder,
  });

  bool temPerguntaSelectionada() {
    return indexPerguntaAtual < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelectionada()
        ? perguntas[indexPerguntaAtual].cast()['respostas']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[indexPerguntaAtual]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            onPress: () => responder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
