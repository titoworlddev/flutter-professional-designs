import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _CuadradoAnimado()));
  }
}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  // animaciones
  // bounceOut
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;
  late Animation<double> bordes;
  late Animation<double> bordes2;

  late Size size;

  @override
  void initState() {
    // incializar todo
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moverArriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));

    // Se puede usar esa si aabajo sumas los valores como hace fernando o sino la otra mas facil de entender
    moverIzquierda = Tween(begin: 100.0, end: 0.0).animate(
        // moverIzquierda = Tween(begin: 0.0, end: -100.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));

    // Se puede usar esa si abajo sumas los valores como hace fernando o sino la otra mas facil de entender
    moverAbajo = Tween(begin: -100.0, end: 0.0).animate(
        // moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    bordes = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.50, curve: Curves.easeInOut)));
    bordes2 = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.50, 1.0, curve: Curves.easeInOut)));

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
    controller.forward();
    size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(
              // (moverDerecha.value == 100.0) ? moverIzquierda.value : moverDerecha.value,
              // (moverArriba.value == -100.0) ? moverAbajo.value : moverArriba.value,
              (moverDerecha.value < 100.0)
                  ? moverDerecha.value
                  : moverIzquierda.value,
              (moverArriba.value > -100.0)
                  ? moverArriba.value
                  : moverAbajo.value,
              // moverDerecha.value + moverIzquierda.value,
              // moverArriba.value + moverAbajo.value
            ),
            child: GestureDetector(
                onTap: () {
                  controller.reset();
                  controller.forward();
                },
                child: _Rectangulo(
                  borderRadius: BorderRadius.all(
                      Radius.circular(bordes.value - bordes2.value)),
                )));
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;

  const _Rectangulo({Key? key, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue, borderRadius: borderRadius),
    );
  }
}
