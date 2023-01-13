import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
import 'package:disenos_app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => ThemeChanger(2)),
//         ChangeNotifierProvider(create: (context) => LayoutModel())
//       ],
//       child: MyApp(),
//     )
//   );
// }
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LayoutModel(),
      child: ChangeNotifierProvider(
        create: (context) => ThemeChanger(2),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print('Orientacion: $orientation');
          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return const LauncherTabletPage();
          } else {
            return const LauncherPage();
          }
        },
      ),
    );
  }
}
