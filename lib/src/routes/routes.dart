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

  _Route(FontAwesomeIcons.heading,     'Encabezados',       HeadersPage()),
  _Route(FontAwesomeIcons.magic,       'Animaciones',       AnimacionesPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'CuadroAnimado',     CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.squareFull,  'AnimatedContainer', AnimatedContainerPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Barra progreso',    GraficasCircularesPage()),
  _Route(FontAwesomeIcons.slideshare,  'SlideShow',         SlideshowPage()),
  _Route(FontAwesomeIcons.pinterest,   'Pinterest',         PinterestPage()),
  _Route(FontAwesomeIcons.ambulance,   'Emergencia',        EmergencyPage()),
  _Route(FontAwesomeIcons.mobile,      'Slivers',           SliverListPage()),

];


// Solo pongo esta porque es otro ejemplo de como hacerlo, aunque es mejor la otra por la facilidad pero en otros casos
// puede ser mejor esta
final routesList = <Map<String, dynamic>>[
  {'icon': FontAwesomeIcons.heading,     'titulo': 'Encabezados',       'page': HeadersPage()},
  {'icon': FontAwesomeIcons.magic,       'titulo': 'Animaciones',       'page': AnimacionesPage()},
  {'icon': FontAwesomeIcons.peopleCarry, 'titulo': 'CuadroAnimado',     'page': CuadradoAnimadoPage()},
  {'icon': FontAwesomeIcons.squareFull,  'titulo': 'AnimatedContainer', 'page': AnimatedContainerPage()},
  {'icon': FontAwesomeIcons.circleNotch, 'titulo': 'Barra progreso',    'page': GraficasCircularesPage()},
  {'icon': FontAwesomeIcons.slideshare,  'titulo': 'SlideShow',         'page': SlideshowPage()},
  {'icon': FontAwesomeIcons.pinterest,   'titulo': 'Pinterest',         'page': PinterestPage()},
  {'icon': FontAwesomeIcons.ambulance,   'titulo': 'Emergencia',        'page': EmergencyPage()},
  {'icon': FontAwesomeIcons.mobile,      'titulo': 'Slivers',           'page': SliverListPage()},
];

class _Route {

  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);

}