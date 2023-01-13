import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function() onPress;
  
  BotonGordo({
    Key? key, 
    this.icon = FontAwesomeIcons.circle, 
    required this.texto, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey, 
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(
            color1: color1,
            color2: color2,
            icon: icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40,),
              FaIcon(icon, size: 40, color: Colors.white,),
              SizedBox(width: 20,),
              Expanded(child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 18),)),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,),
              SizedBox(width: 40,),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  final IconData icon;

  _BotonGordoBackground({
    required this.color1, 
    required this.color2,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Stack(
          children: [
            Positioned(
              top: -25,
              right: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2),)
            )
          ],
        ),
      ),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ]
        )
      ),
    );
  }
}