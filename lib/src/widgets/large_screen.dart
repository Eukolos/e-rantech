import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/image_path.dart';
import 'menu_items.dart';

class LargeScreen extends StatelessWidget {
  final Widget widget;

  const LargeScreen({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: MenuItems(isDrawer: false,),
        ),widget,

      ],
    );
  }
}

