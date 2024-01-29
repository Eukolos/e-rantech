import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/image_path.dart';
import 'menu_items.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: MenuItems(isDrawer: false,),
        ),
        Expanded(
          flex: 4, // Represents 70% of the available space
          child: Container(
            height: 1000,
            //hex color
            color: const Color(0xffF6F6F6),
          ),
        ),
      ],
    );
  }
}

