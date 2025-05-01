import 'package:flutter/material.dart';
import 'package:myapp/components/orange_area.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreBoardPageState();
}

class _ScoreBoardPageState extends State<ScoreboardPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextTheme textTheme = themeData.textTheme;
    var timesEValores = {
      "Ziraldos": 3,
      "Sicranos": 1,
      "Autoconvidados": 8,
      "Sparrings": 5,
    };

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 25,
                ),
                child: BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(colorScheme.primary),
                    iconSize: WidgetStatePropertyAll(35),
                  ),
                ),
              ),
              Text(
                "PLACAR GERAL",
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onPrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 25,
                ),
                child: IconButton(
                  icon: Icon(Icons.show_chart),
                  onPressed: () {},
                  style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(colorScheme.primary),
                    iconSize: WidgetStatePropertyAll(35),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 50),
                      Icon(
                        Icons.bar_chart,
                        color: colorScheme.primary,
                        size: 40,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: colorScheme.primary,
                        size: 40,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: colorScheme.primary,
                        size: 40,
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: colorScheme.primary,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                OrangeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        child: Text("A", style: themeData.textTheme.titleSmall),
                      ),
                      _scoreboardLine("Ziraldos", 25, false, themeData),
                      _scoreboardLine("Ziraldos", 25, false, themeData),
                      _scoreboardLine("Ziraldos", 10, false, themeData),
                      _scoreboardLine("Sparrings", 25, false, themeData),
                    ],
                  ),
                ),
                OrangeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        child: Text("B", style: themeData.textTheme.titleSmall),
                      ),
                      _scoreboardLine("Sparrings", 10, true, themeData),
                      _scoreboardLine("Sicranos", 10, true, themeData),
                      _scoreboardLine("Autoconvidados", 25, true, themeData),
                      _scoreboardLine("Autoconvidados", 10, true, themeData),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 35),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "0:24'",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: "90\"",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "0:14'",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: "23\"",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "0:35'",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: "04\"",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "0:11'",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 22,
                              ),
                            ),
                            TextSpan(
                              text: "29\"",
                              style: textTheme.labelMedium?.copyWith(
                                fontSize: 16,
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(125, 255, 255, 255),
                border: Border.symmetric(
                  horizontal: BorderSide(color: colorScheme.primary, width: 3),
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timesEValores.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: FittedBox(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "${timesEValores.keys.elementAt(index)}:",
                              style: textTheme.labelMedium,
                            ),
                          ),
                          Text(
                            timesEValores.values.elementAt(index).toString(),
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreboardLine(
    String nome,
    int value,
    bool ladoDireito,
    ThemeData themeData,
  ) {
    Color valueColor;

    if (value == 25) {
      valueColor = themeData.colorScheme.onPrimary;
    } else {
      valueColor = themeData.colorScheme.secondary;
    }

    if (ladoDireito) {
      return Row(
        children: [
          Flexible(
            flex: 2,
            child: Center(
              child: Text(
                value.toString(),
                style: themeData.textTheme.labelMedium?.copyWith(
                  fontSize: 27,
                  color: valueColor,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(
              nome,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: themeData.textTheme.labelMedium?.copyWith(fontSize: 22),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Text(
            nome,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            style: themeData.textTheme.labelMedium?.copyWith(fontSize: 22),
          ),
        ),
        Flexible(
          flex: 2,
          child: Center(
            child: Text(
              value.toString(),
              style: themeData.textTheme.labelMedium?.copyWith(
                fontSize: 27,
                color: valueColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
