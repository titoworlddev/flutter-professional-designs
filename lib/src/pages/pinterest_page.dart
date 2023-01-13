import 'package:disenos_app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [const PinterestGrid(), _PinterestMenuLocation()],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final width =  MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
        bottom: 30,
        child: Row(
          children: [
            // Lo del spacer es el modo que usa Fernando y poniendo un container antes del row con el ancho de la pantalla,
            // pero creo que es mas facil lo de poner el aligment.center en el stack
            // Spacer(),
            PinterestMenu(
              mostrar: mostrar,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.colorScheme.secondary,
              // inactiveColor: Colors.blueGrey,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(
                    icon: Icons.supervised_user_circle, onPressed: () {}),
              ],
            ),
            // Spacer(),
          ],
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      // // Este es el metodo de fernando que funciona perfecto pero lo hace inmediato y quizas no es el efeto que se busca
      // // porque lo ideal pienso que seria que se oculte cuando has hecho bastante scroll como para que quede claro que
      // // te estas moviendo y no que le has dado sin querer.
      // if (controller.offset > scrollAnterior) {
      //   Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      // } else {
      //   Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      // }
      // scrollAnterior = controller.offset;

      // Con este metodo se oculta mas tarde y asi queda mejor para mi gusto
      if (controller.offset > scrollAnterior + 250) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        scrollAnterior = controller.offset;
      } else if (controller.offset < scrollAnterior - 50) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        scrollAnterior = controller.offset;
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
    final Size size = MediaQuery.of(context).size;
    int count;
    if (size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }
    return StaggeredGridView.countBuilder(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      crossAxisCount:
          count, // el numero de elementos maximo que cabe en el vertical, teniendo en cuenta el tamaño especificado abajo
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) => StaggeredTile.count(
          1, index.isEven ? 1 : 2), // el tamaño de la celda en ancho y alto
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.all(5),
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}
