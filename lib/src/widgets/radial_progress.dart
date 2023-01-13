import 'dart:math';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {

  final porcentaje;
  // final Color? colorPrimario;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;
  final double height;
  final double width;
  final StrokeCap tipoBordes;
  final List<Color>? gradiente;
  
  const RadialProgress({
    required this.porcentaje,
    // this.colorPrimario,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey, 
    this.grosorSecundario = 4, 
    this.grosorPrimario = 10, 
    this.tipoBordes = StrokeCap.butt, 
    this.gradiente, 
    this.height = 100, 
    this.width = 100,
  });
  // }) : assert (colorPrimario == null || gradiente == null, 
    // 'Cannot provide both colorPrimario and gradiente\n'
    // 'If u provide gradiente, then remove colorPrimario',);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() { 
    super.initState();

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));

  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: widget.height,
          width: widget.width,
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
                widget.colorPrimario,
                widget.colorSecundario,
                widget.grosorPrimario,
                widget.grosorSecundario,
                widget.tipoBordes,
                widget.gradiente,
              ),
            ),
          ),
        );
      },
    );

  }
}

class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  // final Color? colorPrimario;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  final StrokeCap tipoBordes;
  final List<Color>? gradiente;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario, 
    this.colorSecundario, 
    this.grosorPrimario,
    this.grosorSecundario, 
    this.tipoBordes, 
    this.gradiente,
  );

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(0 , 0), 
      radius: 180
    );


    // final Color colorGradiente = (colorPrimario == null ) ? Colors.blue : colorPrimario!;
    // final Gradient gradient = new LinearGradient(
    //   colors: (gradiente == null) ? [colorGradiente, colorGradiente] : gradiente!
    // );

    final Gradient gradient = new LinearGradient(
      colors: (gradiente == null) ? [colorPrimario, colorPrimario] : gradiente!
    );

    //Circulo completado
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;
    
    final center = new Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      // ..color = (colorPrimario == null ) ? Colors.blue : colorPrimario!
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = tipoBordes;

    // Parte que se debera ir llenando
    double arcAngle = 2 * pi * ( porcentaje / 100 );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), // donde quiero que se dibuje
      -pi / 2, // angulo donde empieza a llenarse
      // grados * -90, // se puede poner tambien con los grados ((pi / 180) * gradosquequiero ) si pones -90 grados queda arriba perfecto
      arcAngle, // angulo que se llena del color
      false, 
      paintArco);

  }

  @override
  bool shouldRepaint(_MiRadialProgress oldDelegate) => true;

}