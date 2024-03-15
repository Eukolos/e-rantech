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
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                ),
                const GradientText(
                  text: "Dashboard",
                  gradientColors: [Color(0xFF1968B2), Color(0xFF30A1F8)],
                  fontSize: 40,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  width: 300,
                )
              ],
            )
          : const Text(
              "Dashboard",
              style: TextStyle(
                //gradient color
                color: Color(0xff2A75BC),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
      centerTitle: !ResponsiveWidget.isSmallScreen(context) ? false : true,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );

class GradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;
  final List<Color> gradientColors;

  const GradientText(
      {required this.text,
      this.fontSize = 40,
      this.letterSpacing = 5,
      this.fontWeight = FontWeight.bold,
      required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
          color: Colors
              .white, // This color won't be used, as we're using ShaderMask for gradient
        ),
      ),
    );
  }
}
