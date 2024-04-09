import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, String> _optionWinsTo = {
    'pedra': 'tesoura',
    'papel': 'pedra',
    'tesoura': 'papel'
  };
  String _resultText = 'Escolha uma opção abaixo';
  AssetImage _botAsset = const AssetImage('images/padrao.png');

  void _onSelectedOption(String userSelectedOption) {
    List<String> options = _optionWinsTo.keys.toList();
    int generatedOptionIdx = Random().nextInt(options.length);
    String generatedOption = options[generatedOptionIdx];

    setState(() {
      _botAsset = AssetImage('images/$generatedOption.png');
    });

    if (generatedOption == userSelectedOption) {
      setState(() {
        _resultText = 'Empate!';
      });
      return;
    }

    bool userWins = _optionWinsTo[userSelectedOption] == generatedOption;

    setState(() {
      _resultText = userWins ? 'Você venceu ;)' : 'Você perdeu :(';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                  children: [
                    const Text(
                        'Escolha do App:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image(image: _botAsset, height: 110),
                    ),
                  ]
              )
            ),
            Column(
              children: [
                Text(
                    _resultText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => _onSelectedOption('pedra'),
                          child: Image.asset('images/pedra.png', height: 100),
                        ),
                        GestureDetector(
                          onTap: () => _onSelectedOption('papel'),
                          child: Image.asset('images/papel.png', height: 100),
                        ),
                        GestureDetector(
                          onTap: () => _onSelectedOption('tesoura'),
                          child: Image.asset('images/tesoura.png', height: 100),
                        ),
                      ],
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
