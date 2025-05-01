import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/buttons/plus_button.dart';
import 'package:myapp/buttons/standard_button.dart';
import 'package:myapp/components/orange_area.dart';
import 'package:myapp/pages/scoreboard_page.dart';

class SetPage extends StatefulWidget {
  const SetPage({super.key});

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  ),
                  child: BackButton(
                    onPressed: () {
                      Navigator.pop(context);

                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                      ]);
                    },
                    style: ButtonStyle(
                      iconColor: WidgetStatePropertyAll(colorScheme.primary),
                      iconSize: WidgetStatePropertyAll(35),
                    ),
                  ),
                ),
                _listaTiposPontos(false, themeData),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              spacing: 10,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 10,
                          children: [
                            _topoPlacar("A", "Ziraldos", themeData),
                            OrangeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Image.asset(
                                        'images/ball.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "12",
                                    style: textTheme.labelMedium?.copyWith(
                                      fontSize: 75,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 10,
                          children: [
                            _topoPlacar("B", "Autoconvidados", themeData),
                            OrangeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "22",
                                    style: textTheme.titleMedium?.copyWith(
                                      fontSize: 75,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: textTheme.labelMedium?.copyWith(fontSize: 20),
                    children: [
                      TextSpan(text: "Tempo de jogo: 1:14'"),
                      TextSpan(
                        text: "00\"",
                        style: textTheme.labelMedium?.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: StandardButton(
                    onPressed: () => _setEndedDialog(context),
                    text: "Placar Geral",
                    textSize: 30,
                    horizontalPadding: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 25,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                    style: ButtonStyle(
                      iconColor: WidgetStatePropertyAll(colorScheme.primary),
                      iconSize: WidgetStatePropertyAll(35),
                    ),
                  ),
                ),
                _listaTiposPontos(true, themeData),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listaTiposPontos(bool ladoDireito, ThemeData themeData) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            _tipoPonto("Ace", ladoDireito, themeData),
            _tipoPonto("Ataque", ladoDireito, themeData),
            _tipoPonto("Bloqueio", ladoDireito, themeData),
            _tipoPonto("Erro", ladoDireito, themeData),
          ],
        ),
      ),
    );
  }

  Widget _tipoPonto(String nome, bool ladoDireito, ThemeData themeData) {
    if (ladoDireito) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              nome,
              style: themeData.textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PlusButton(),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PlusButton(),
          ),
          Expanded(
            child: Text(
              nome,
              style: themeData.textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }
  }

  Widget _topoPlacar(String letra, String nomeTime, ThemeData themeData) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: CircleAvatar(
            child: Text(letra, style: themeData.textTheme.titleSmall),
          ),
        ),
        Text(
          nomeTime,
          style: themeData.textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Future<void> _setEndedDialog(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return showDialog(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              "FIM DE SET",
              textAlign: TextAlign.center,
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            backgroundColor: const Color.fromARGB(125, 255, 255, 255),
            contentPadding: EdgeInsets.symmetric(horizontal: 40),
            scrollable: true,
            content: Column(
              children: [
                Text(
                  "Autoconvidados",
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 75,
                    color: colorScheme.onPrimary,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "VENCEU",
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 25,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              StandardButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScoreboardPage()),
                  );
                },
                text: "Terminar",
                horizontalPadding: 40,
              ),
              StandardButton(
                onPressed: () {},
                text: "Novo Set",
                textColor: Theme.of(context).colorScheme.secondary,
                horizontalPadding: 40,
              ),
            ],
          ),
    );
  }
}
