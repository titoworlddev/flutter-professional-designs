import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorActivo;
  final Color colorInactivo;
  final double activoSize;
  final double inactivoSize;
  final ScrollPhysics? physics;

  const SlideShow(
      {super.key,
      required this.slides,
      this.puntosArriba = false,
      this.colorActivo = Colors.blue,
      this.colorInactivo = Colors.grey,
      this.activoSize = 12.0,
      this.inactivoSize = 12.0,
      this.physics = const BouncingScrollPhysics()});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      builder: (context, child) {
        Provider.of<_SlideshowModel>(context).colorPrimario = colorActivo;
        Provider.of<_SlideshowModel>(context).colorSecundario = colorInactivo;
        Provider.of<_SlideshowModel>(context).activoSize = activoSize;
        Provider.of<_SlideshowModel>(context).inactivoSize = inactivoSize;
        return SafeArea(
          child: Center(
              child: _CrearEstructuraSlideshow(
            puntosArriba: puntosArriba,
            slides: slides,
            physics: physics,
          )),
        );
      },
      // child: SafeArea(
      //   child: Center(
      //     child: Builder(
      //       builder: (context) {
      //         Provider.of<_SlideshowModel>(context).colorPrimario = colorActivo;
      //         Provider.of<_SlideshowModel>(context).colorSecundario = colorInactivo;
      //         return _CrearEstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
      //       },
      //     )
      //   ),
      // ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow(
      {Key? key,
      required this.puntosArriba,
      required this.slides,
      required this.physics})
      : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(slides.length),
        Expanded(child: _Slides(slides, physics)),
        if (!puntosArriba) _Dots(slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totaSlides;

  const _Dots(this.totaSlides);

  @override
  Widget build(BuildContext context) {
    // final List<Widget> dotsList = [];
    // for (var i = 0; i < totaSlides; i++) {
    //   dotsList.add(_Dot(i));
    // }

    return Container(
      color: Colors.transparent,
      width: 30 * totaSlides.toDouble(),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: dotsList,
        children: List.generate(
            totaSlides,
            (i) => _Dot(
                i)), // Esto basicamente sustituye al ciclo for que hay arriba porque hace lo mismo
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);

    double tamano = 12;
    Color color;
    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      tamano = ssModel.activoSize;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.inactivoSize;
      color = ssModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  final ScrollPhysics? physics;

  const _Slides(this.slides, this.physics);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: widget.physics,
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide);
  }
}

class _SlideshowModel extends ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => _currentPage;
  set currentPage(double valor) {
    _currentPage = valor;
    notifyListeners();
  }

  Color colorPrimario = Colors.blue;

  Color colorSecundario = Colors.grey;

  double activoSize = 12.0;

  double inactivoSize = 12.0;
}
