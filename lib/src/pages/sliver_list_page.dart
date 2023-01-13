import 'package:flutter/material.dart';
import 'package:disenos_app/theme/theme.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(right: 0, bottom: -10, child: _BotonNewList())
      ],
    ));
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      child: MaterialButton(
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.colorScheme.secondary
            : const Color(0xffED6762),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: SizedBox(
          height: 100,
          width: size.width * 0.8,
          child: Center(
            child: Text(
              'CREATE NEW LIST',
              style: TextStyle(
                  color: appTheme.currentTheme.scaffoldBackgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola Mundo'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 170,
            minHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(
              height: 100,
            )
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;
  // double get maxExtent => maxHeight;

  @override
  double get minExtent => (minHeight < maxHeight) ? minHeight : maxHeight;
  // double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
                color: (appTheme.darkTheme)
                    ? Colors.grey
                    : const Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                height: 8,
                width: 100,
                color: (appTheme.darkTheme)
                    ? Colors.grey
                    : const Color(0xfff7cdd5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

// ignore: unused_element
class _ListaTareas extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          // color: (appTheme.darkTheme) ? Colors.grey : color,
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        titulo,
        style: TextStyle(
            color: (appTheme.darkTheme) ? Colors.black87 : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      // child: ,
    );
  }
}
