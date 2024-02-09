import 'package:erantech/src/widgets/app_bar.dart';
import 'package:erantech/src/widgets/large_screen.dart';
import 'package:erantech/src/widgets/menu_items.dart';
import 'package:erantech/src/widgets/menu_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/responsiveness.dart';
import '../widgets/menu_items2.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: MenuItems(
                isDrawer: true,
              ),
            ),
            MenuUserWidget(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  "© 2024 POWERED BY eukolos",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ResponsiveWidget(
          largeScreen: LargeScreen(
            widget: Expanded(
              flex: 4, // Represents 70% of the available space
              child: Container(
                height: 1000,
                //hex color
                color: const Color(0xffF6F6F6),
              ),
            ),
          ),
          smallScreen: Container(
            color: Colors.black45,
          )),
    );
  }
}

