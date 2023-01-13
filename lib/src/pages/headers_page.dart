import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:disenos_app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatefulWidget {
  const HeadersPage({super.key});

  @override
  State<HeadersPage> createState() => _HeadersPageState();
}

class _HeadersPageState extends State<HeadersPage> {
  String header = 'cuadrado';

  @override
  Widget build(BuildContext context) {
    final appTheme =
        Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;
    final appTheme2 = Provider.of<ThemeChanger>(context)
        .currentTheme
        .colorScheme
        .secondary
        .withGreen(225);
    final appTheme3 = Provider.of<ThemeChanger>(context)
        .currentTheme
        .colorScheme
        .secondary
        .withGreen(150);

    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          (header == 'wave')
              ? HeaderWave(
                  color: appTheme,
                )
              : (header == 'pico')
                  ? HeaderPico(appTheme)
                  : (header == 'diagonal')
                      ? HeaderDiagonal(appTheme)
                      : (header == 'curvo')
                          ? HeaderCurvo(appTheme)
                          : (header == 'cuadrado')
                              ? HeaderCuadrado(appTheme)
                              : (header == 'wavegradient')
                                  ? HeaderWaveGradient(
                                      appTheme, appTheme2, appTheme3)
                                  : (header == 'triangular')
                                      ? HeaderTriangular(appTheme)
                                      : HeaderBordesRedondeados(appTheme),
          Positioned(
            bottom: 10,
            child: PinterestMenu(items: [
              PinterestButton(
                  onPressed: () {
                    header = 'cuadrado';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.squareFull),
              PinterestButton(
                  onPressed: () {
                    header = 'cuadradoredondos';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.stop),
              PinterestButton(
                  onPressed: () {
                    header = 'diagonal';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.slash),
              PinterestButton(
                  onPressed: () {
                    header = 'triangular';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.slash),
              PinterestButton(
                  onPressed: () {
                    header = 'pico';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.play),
              PinterestButton(
                  onPressed: () {
                    header = 'curvo';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.circle),
              PinterestButton(
                  onPressed: () {
                    header = 'wave';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.stumbleupon),
              PinterestButton(
                  onPressed: () {
                    header = 'wavegradient';
                    setState(() {});
                  },
                  icon: FontAwesomeIcons.stumbleupon),
            ]),
          )
        ],
      ),
    ));
  }
}
