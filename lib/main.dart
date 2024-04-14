import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _indexPerguntaAtual = 0;
  var _pontuacaoTotal = 0;

  final _perguntasMatematica = const [
    {
      'texto': 'Qual é o resultado de 2 + 2?',
      'respostas': [
        {'texto': '4', 'pontuacao': 10},
        {'texto': '3', 'pontuacao': 0},
        {'texto': '1', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Quanto é 8 vezes 3?',
      'respostas': [
        {'texto': '24', 'pontuacao': 10},
        {'texto': '8', 'pontuacao': 0},
        {'texto': '11', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual é a raiz quadrada de 16?',
      'respostas': [
        {'texto': '6', 'pontuacao': 0},
        {'texto': '8', 'pontuacao': 0},
        {'texto': '4', 'pontuacao': 10},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      if (temPerguntaSelectionada()) {
        _indexPerguntaAtual++;
        _pontuacaoTotal += pontuacao;
      }
    });
  }

  void _reuniciarQuestionario() {
    setState(() {
      _indexPerguntaAtual = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool temPerguntaSelectionada() {
    return _indexPerguntaAtual < _perguntasMatematica.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
        ),
        body: temPerguntaSelectionada()
            ? Questionario(
                perguntas: _perguntasMatematica,
                indexPerguntaAtual: _indexPerguntaAtual,
                responder: _responder)
            : Resultado(this._pontuacaoTotal, _reuniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
