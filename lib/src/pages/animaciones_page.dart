import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  final double grados = 3.141592653589793 / 180;
  final double vueltas = 2.0 * 3.141592653589793;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: vueltas * 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.75, curve: Curves.easeOut)));

    // opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    // );
    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    moverDerecha = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    agrandar = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.repeat();
        // controller.reverse();
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Play / Reproduccion
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: agrandar.value,
          child: Transform.translate(
            offset: Offset(moverDerecha.value, 0),
            child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                    // opacity: opacidad.value - opacidadOut.value,
                    opacity: (opacidad.value == 1.0)
                        ? opacidadOut.value
                        : opacidad.value, // tambien se puede hacer esto
                    // opacity: (controller.value > 0.75) ? opacidadOut.value : opacidad.value, // o incluso esto (0.75 porque opacidadOut empieza en ese momento y opacidad acaba ahi tambien)
                    // tambien se podria poner otro Opacity() antes de este, poner los valores de opacidadOut desde 1.0 a 0.0
                    // y cuando llegue a 0.75 del tiempo baja hasta 0, lo cual haria el mismo efecto
                    child: child)),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Container(
        alignment: Alignment.topCenter,
        child: const Icon(
          Icons.arrow_upward,
          size: 30,
        ),
      ),
    );
  }
}
