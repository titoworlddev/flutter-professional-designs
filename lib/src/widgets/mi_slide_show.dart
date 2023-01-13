import 'package:flutter/material.dart';

class MiSlideShow extends StatefulWidget {
  final List<Widget> slides;

  const MiSlideShow({super.key, required this.slides});

  @override
  State<MiSlideShow> createState() => _MiSlideShowState();
}

class _MiSlideShowState extends State<MiSlideShow> {
  final SliderModel sliderModel = SliderModel();
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      sliderModel.currentPage = pageViewController.page!;
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(child: _Slides(widget.slides, pageViewController)),
          _Dots(widget.slides.length)
        ],
      ),
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

    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: dotsList,
        children: List.generate(totaSlides, (i) => _Dot(i)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final SliderModel sliderModel = SliderModel();
    final pageViewindex = sliderModel.currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewindex >= index - 0.5 && pageViewindex < index + 0.5)
              ? const Color(0xffFF6389)
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  final PageController pageViewController;

  const _Slides(this.slides, this.pageViewController);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final SliderModel sliderModel = SliderModel();

  @override
  void initState() {
    super.initState();

    widget.pageViewController.addListener(() {
      sliderModel.currentPage = widget.pageViewController.page!;
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageViewController,
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

class SliderModel {
  static final SliderModel _singleton = SliderModel._internal();

  factory SliderModel() {
    return _singleton;
  }

  SliderModel._internal();

  double currentPage = 0;
}
