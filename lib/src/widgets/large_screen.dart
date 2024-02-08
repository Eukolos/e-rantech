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
        Container(
          width: 300,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: MenuItems(isDrawer: false,)),
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
        ),widget,

      ],
    );
  }
}

