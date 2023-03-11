import 'dart:math';

import 'package:flutter/material.dart';

class JogoScreen extends StatefulWidget {
  const JogoScreen({super.key});

  @override
  State<JogoScreen> createState() => _JogoScreenState();
}

class _JogoScreenState extends State<JogoScreen> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhadoApp = opcoes[numero];

    switch (escolhadoApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage(
            "images/pedra.png",
          );
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage(
            "images/papel.png",
          );
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage(
            "images/tesoura.png",
          );
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhadoApp == "tesousa") ||
        (escolhaUsuario == "tesoura" && escolhadoApp == "papel") ||
        (escolhaUsuario == "papel" && escolhadoApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns meu patrão, você ganhou";
      });
    } else if ((escolhadoApp == "pedra" && escolhaUsuario == "tesousa") ||
        (escolhadoApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhadoApp == "papel" && escolhaUsuario == "pedra")) {
      this._mensagem = "Vish meu patrão, você perdeu";
    } else {
      setState(() {
        this._mensagem = "Deu empate chefia";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 110,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 110,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesou ra"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 110,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
