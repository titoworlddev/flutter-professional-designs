import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  
  final Color color;

  const HeaderCuadrado(this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: color // Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  
  final Color color;

  const HeaderBordesRedondeados(this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: color, // Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70))
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  
  final Color color;

  const HeaderDiagonal(this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(color),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  
  final Color color;

  const _HeaderDiagonalPainter(this.color);
  
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint(); // Lapiz

    // Propiedades ( Color, ancho del lapiz, etc )
    lapiz.color = color; // Color(0xff615AAB);
    // lapiz.style = PaintingStyle.stroke; // .stroke = bordes & .fill = relleno
    lapiz.style = PaintingStyle.fill; // .stroke = bordes & .fill = relleno
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz); // Usa ese lapiz para dibujar el path indicado

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangular extends StatelessWidget {
  
  final Color color;

  const HeaderTriangular(this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(color),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  
  final Color color;

  const _HeaderTriangularPainter(this.color);
  
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint(); // Lapiz

    // Propiedades ( Color, ancho del lapiz, etc )
    lapiz.color = color; // Color(0xff615AAB);
    // lapiz.style = PaintingStyle.stroke; // .stroke = bordes & .fill = relleno
    lapiz.style = PaintingStyle.fill; // .stroke = bordes & .fill = relleno
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz); // Usa ese lapiz para dibujar el path indicado

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  
  final Color color;

  const HeaderPico(this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(color),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  
  final Color color;

  const _HeaderPicoPainter(this.color);
  
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint(); // Lapiz

    // Propiedades ( Color, ancho del lapiz, etc )
    lapiz.color = color; // Color(0xff615AAB);
    // lapiz.style = PaintingStyle.stroke; // .stroke = bordes & .fill = relleno
    lapiz.style = PaintingStyle.fill; // .stroke = bordes & .fill = relleno
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.32);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height);

    // si se quieren hacer mas figuras pues se puede mover el lapiz a otro sitio
    // seguir dibujando desde alli
    path.moveTo(size.width, size.height);
    path.lineTo(size.width * 0.5, size.height * 0.75);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width, size.height);

    path.moveTo(0, size.height * 0.45);
    path.lineTo(size.width * 0.5, size.height * 0.45);
    path.lineTo(size.width * 0.5, size.height * 0.55);
    path.lineTo(0, size.height * 0.55);
    

    canvas.drawPath(path, lapiz); // Usa ese lapiz para dibujar el path indicado

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {

  final Color color;

  const HeaderCurvo(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(color),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  
  final Color color;

  const _HeaderCurvoPainter(this.color);
  
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint(); // Lapiz

    // Propiedades ( Color, ancho del lapiz, etc )
    lapiz.color = color; // Color(0xff615AAB);
    // lapiz.style = PaintingStyle.stroke; // .stroke = bordes & .fill = relleno
    lapiz.style = PaintingStyle.fill; // .stroke = bordes & .fill = relleno
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    canvas.drawPath(path, lapiz); // Usa ese lapiz para dibujar el path indicado

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {

  final Color color;

  const HeaderWave({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {

  final Color color;

  const _HeaderWavePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint(); // Lapiz

    // Propiedades ( Color, ancho del lapiz, etc )
    lapiz.color = color; // Color(0xff615AAB);
    // lapiz.style = PaintingStyle.stroke; // .stroke = bordes & .fill = relleno
    lapiz.style = PaintingStyle.fill; // .stroke = bordes & .fill = relleno
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Para dibujarlo en el lado contrario lo siguiente
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.70, size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz); // Usa ese lapiz para dibujar el path indicado

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Lo mismo con gradiente
class HeaderWaveGradient extends StatelessWidget {
  
  final Color color1;
  final Color color2;
  final Color color3;

  const HeaderWaveGradient(this.color1, this.color2, this.color3);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(this.color1, this.color2, this.color3),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {

  final Color color1;
  final Color color2;
  final Color color3;

  const _HeaderWaveGradientPainter(this.color1, this.color2, this.color3);
  
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 55.0), 
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        // Color(0xff6D05E8),
        // Color(0xffC012FF),
        // Color(0xff6D05FA),
        this.color1, this.color2, this.color3
      ],
      stops: [
        0.2,
        0.5,
        1.0,
      ]
    );

    final lapiz = new Paint()..shader = gradiente.createShader(rect); // Lapiz

    // Propiedades ( Color, ancho del lapiz, etc )
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    // lapiz.style = PaintingStyle.stroke; // .stroke = bordes & .fill = relleno
    lapiz.style = PaintingStyle.fill; // .stroke = bordes & .fill = relleno
    lapiz.strokeWidth = 20;

    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    // Para dibujarlo en el lado contrario lo siguiente
    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.70, size.width * 0.5, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz); // Usa ese lapiz para dibujar el path indicado

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  IconHeader({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });
  
  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2,),
        Positioned(
          top: -50,
          left: -50,
          child: FaIcon(icon, size: 200, color: Colors.white.withOpacity(0.2),),
        ),

        Column(
          children: [
            SizedBox(height: 80, width: double.infinity,),
            Text(subtitulo, style: TextStyle(fontSize: 20, color: colorBlanco),),
            SizedBox(height: 20,),
            Text(titulo, style: TextStyle(fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white,),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  _IconHeaderBackground({
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2
          ]
        )
      )
    );
  }
}