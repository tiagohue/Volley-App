import 'package:flutter/material.dart';
import 'package:myapp/buttons/plus_button.dart';
import 'package:myapp/buttons/standard_button.dart';
import 'package:myapp/pages/set_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 50,
          children: [
            SizedBox(
              height: 125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset('images/ball.png'),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Text("Volley", style: textTheme.titleMedium),
                      const Text(
                        "do fim de semana     ",
                        style: TextStyle(
                          color: Color(0xffC2F2F8),
                          fontSize: 11,
                          fontFamily: 'ConcertOne',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Stack(
                      children: [
                        Container(
                          height: 60,
                          width: 230,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(125, 255, 255, 255),
                            border: Border.all(
                              width: 3,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -3,
                          left: 54,
                          right: 54,
                          child: Text('TIMES', style: textTheme.titleMedium),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _linhaTime('Sicranos', 3, themeData),
                      _linhaTime('Autoconvidados', 3, themeData),
                      _linhaTime('Ziraldos', 4, themeData),
                      _linhaTime('Sparrings', 5, themeData),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              spacing: 20,
              children: [
                Text('Jogo Casado', style: textTheme.labelMedium),
                StandardButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SetPage(),
                      ),
                    );
                  },
                  text: "Iniciar",
                  horizontalPadding: 80,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: PlusButton(),
    );
  }

  Widget _linhaTime(String nomeTime, int nJogadores, ThemeData themeData) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      child: Row(
        children: [
          Text(
            '$nomeTime ',
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
            style: themeData.textTheme.labelMedium!.copyWith(
              color: themeData.colorScheme.secondary,
            ),
          ),
          Text(
            '$nJogadores',
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
            style: const TextStyle(
              color: Color(0Xff2B4A8E),
              fontSize: 55,
              fontFamily: 'ConcertOne',
            ),
          ),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              'Jogadores',
              textHeightBehavior: TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
              style: const TextStyle(
                color: Color(0Xff2B4A8E),
                fontSize: 9,
                fontFamily: 'ConcertOne',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
