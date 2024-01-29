import 'package:flutter/material.dart';

import '../helpers/responsiveness.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? null
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState?.openDrawer();
              }),
      title: !ResponsiveWidget.isSmallScreen(context)
          ? Image.asset(
              'assets/images/logo.png',
              width: 300,
            )
          : Image.asset(
              'assets/images/logo.png',
              width: 250,
            ),
      centerTitle: !ResponsiveWidget.isSmallScreen(context)
          ? false
          : true,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
