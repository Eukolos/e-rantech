import 'package:erantech/src/widgets/app_bar.dart';
import 'package:erantech/src/widgets/large_screen.dart';
import 'package:erantech/src/widgets/menu_items.dart';
import 'package:flutter/material.dart';

import 'helpers/responsiveness.dart';

class Rantech extends StatefulWidget {
  const Rantech({super.key, required this.title});

  final String title;

  @override
  State<Rantech> createState() => _RantechState();
}

class _RantechState extends State<Rantech> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: MenuItems(isDrawer: true,),
      ),
      body: ResponsiveWidget(largeScreen: const LargeScreen(), smallScreen: Container(color: Colors.black45,)),
    );
  }
}

