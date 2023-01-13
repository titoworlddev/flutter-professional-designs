import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/theme/theme.dart';
import 'package:disenos_app/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appTheme.colorScheme.secondary,
        child: Icon(Icons.refresh),
        onPressed: () {
          porcentaje += 10;
          if (porcentaje > 100) {
            porcentaje = 0;
          }
          setState(() {});
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.blue,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje / 1.2,
                color: Colors.red,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje / 1.4,
                color: Colors.pink,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje / 1.7,
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Column(
      children: [
        RadialProgress(
          height: 180,
          width: 180,
          porcentaje: porcentaje,
          colorPrimario: color,
          colorSecundario: appTheme.textTheme.bodyText1!.color!,
          grosorPrimario: 10,
          grosorSecundario: 4,
          tipoBordes: StrokeCap.round,
          // gradiente: [
          //   Color(0xffC012ff),
          //   Color(0xff6d05e8),
          //   Colors.red
          // ]
        ),
        Text(
          '${porcentaje.toStringAsFixed(2)} %',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
