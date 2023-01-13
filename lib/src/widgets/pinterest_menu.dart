import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});

}

class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final List<PinterestButton> items;
  
  PinterestMenu({
    this.mostrar = true, 
    this.activeColor = Colors.black, 
    this.inactiveColor = Colors.blueGrey, 
    this.backgroundColor = Colors.white,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      builder: (context, child) {
        Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
        Provider.of<_MenuModel>(context).activeColor = activeColor;
        Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
        return child!;
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItems(items),
          itemsLength: items.length.toDouble(),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  final double itemsLength;

  _PinterestMenuBackground({
    required this.child,
    required this.itemsLength
  });


  @override
  Widget build(BuildContext context) {

    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      // width: 250,
      width: (itemsLength > 6) ? 60 * 6 : 60 * itemsLength,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ] 
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Transform.rotate(
          angle: (item.icon == FontAwesomeIcons.slash && index == 2) ? ((3.141592653589793) / 180) * 110 
          : (item.icon == FontAwesomeIcons.play) ? ((3.141592653589793) / 180) * 90
          : 0,
          child: Icon(
            item.icon,
            size: (itemSeleccionado == index) ? 35 : 25,
            color: (itemSeleccionado == index) ? activeColor : inactiveColor,
          ),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

  int _itemSeleccionado = 0;
  
  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado(int valor) {
    this._itemSeleccionado = valor;
    notifyListeners();
  }

  Color _backgroundColor = Colors.white;
  
  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color valor) {
    this._backgroundColor = valor;
  }

  Color _activeColor = Colors.black;
  
  Color get activeColor => this._activeColor;
  set activeColor(Color valor) {
    this._activeColor = valor;
  }

  Color _inactiveColor = Colors.blueGrey;
  
  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color valor) {
    this._inactiveColor = valor;
  }

}