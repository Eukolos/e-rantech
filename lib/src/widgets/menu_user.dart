
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuUserWidget extends ConsumerWidget {
  const MenuUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 35,
          child: ListTile(
            leading: Icon(Icons.feedback_outlined, color: Colors.black45),
            title: Text("Geri Bildirim"),),
        ),
        Container(
          height: 35,
          child: ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.black45),
            title: Text("Çıkış Yap"),),
        ),
        ListTile(
          leading: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black45,
                      width: 1,
                    ),),
                  child: Image.asset("assets/images/menu_svg/user_male.png"))),
          title: Text("Ahmet Akça"),
          subtitle: Text("a.akca@rantech.com.tr"),
        ),

      ],
    ),);
  }
}