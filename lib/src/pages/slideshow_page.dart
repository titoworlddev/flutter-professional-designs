import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:disenos_app/theme/theme.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';
// import 'package:disenos_app/src/widgets/miSlideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }
    final children = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow()),
    ];

    return Scaffold(
        body: (isLarge)
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              ));
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return SlideShow(
      activoSize: 15,
      inactivoSize: 10,
      colorActivo: (appTheme.darkTheme) ? accentColor : Color(0xffFF6389),
      colorInactivo: Colors.grey,
      puntosArriba: false,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
