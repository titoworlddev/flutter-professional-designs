import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:disenos_app/src/widgets/headers.dart';
import 'package:disenos_app/src/widgets/boton_gordo.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((i) => FadeInLeft(
              duration: const Duration(milliseconds: 500),
              child: BotonGordo(
                icon: i.icon,
                texto: i.texto,
                color1: i.color1,
                color2: i.color2,
                onPress: () {},
              ),
            ))
        .toList();
    // List<Widget> itemList = List.generate(items.length, (i) => BotonGordo(
    //   icon: items[i].icon,
    //   texto: items[i].texto,
    //   color1: items[i].color1,
    //   color2: items[i].color2,
    //   onPress: () {
    //     print(items[i].texto);
    //   },
    // ));

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [SizedBox(height: (isLarge) ? 300 : 0), ...itemMap],
            ),
          ),
          if (isLarge) _Encabezado(),
        ],
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Medica',
          subtitulo: 'Has solicitado',
          color1: Color(0xff536cf6),
          color2: Color(0xff66a9f2),
        ),
        Positioned(
          top: 40,
          right: 0,
          child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carCrash,
      texto: 'Motor Accident',
      color1: const Color(0xff6989F5),
      color2: const Color(0xff906EF5),
      onPress: () {},
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Has seleccionado',
      titulo: 'Asistencia Medica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
