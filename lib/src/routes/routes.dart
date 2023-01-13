import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:disenos_app/src/pages/emergency_page.dart';
import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
import 'package:disenos_app/src/pages/headers_page.dart';
import 'package:disenos_app/src/pages/pinterest_page.dart';
import 'package:disenos_app/src/pages/sliver_list_page.dart';
import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
import 'package:disenos_app/src/pages/animaciones_page.dart';
import 'package:disenos_app/src/pages/animated_container_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.heading, 'Encabezados', const HeadersPage()),
  _Route(FontAwesomeIcons.magic, 'Animaciones', const AnimacionesPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'CuadroAnimado',
      const CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.squareFull, 'AnimatedContainer',
      const AnimatedContainerPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra progreso',
      const GraficasCircularesPage()),
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', const SlideshowPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', const EmergencyPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListPage()),
];

// Solo pongo esta porque es otro ejemplo de como hacerlo, aunque es mejor la otra por la facilidad pero en otros casos
// puede ser mejor esta
final routesList = <Map<String, dynamic>>[
  {
    'icon': FontAwesomeIcons.heading,
    'titulo': 'Encabezados',
    'page': const HeadersPage()
  },
  {
    'icon': FontAwesomeIcons.magic,
    'titulo': 'Animaciones',
    'page': const AnimacionesPage()
  },
  {
    'icon': FontAwesomeIcons.peopleCarry,
    'titulo': 'CuadroAnimado',
    'page': const CuadradoAnimadoPage()
  },
  {
    'icon': FontAwesomeIcons.squareFull,
    'titulo': 'AnimatedContainer',
    'page': const AnimatedContainerPage()
  },
  {
    'icon': FontAwesomeIcons.circleNotch,
    'titulo': 'Barra progreso',
    'page': const GraficasCircularesPage()
  },
  {
    'icon': FontAwesomeIcons.slideshare,
    'titulo': 'SlideShow',
    'page': const SlideshowPage()
  },
  {
    'icon': FontAwesomeIcons.pinterest,
    'titulo': 'Pinterest',
    'page': const PinterestPage()
  },
  {
    'icon': FontAwesomeIcons.ambulance,
    'titulo': 'Emergencia',
    'page': const EmergencyPage()
  },
  {
    'icon': FontAwesomeIcons.mobile,
    'titulo': 'Slivers',
    'page': const SliverListPage()
  },
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
