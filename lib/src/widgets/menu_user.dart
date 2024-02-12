

import 'package:erantech/src/constants/image_path.dart';
import 'package:erantech/src/models/user.dart';
import 'package:erantech/src/providers/login_controller_provider.dart';
import 'package:erantech/src/providers/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class MenuUserWidget extends ConsumerStatefulWidget {
  const MenuUserWidget({
    super.key,
  });

  @override
  ConsumerState<MenuUserWidget> createState() => _MenuUserWidgetState();
}

class _MenuUserWidgetState extends ConsumerState<MenuUserWidget> {



  @override
  Widget build(BuildContext context) {
    User? _user;
    final state = ref.watch(loginControllerProvider);
    if (state is LoginStateSuccess) {
      _user = state.user;
    }
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 35,
            child: ListTile(
              leading: Icon(Icons.feedback_outlined, color: Colors.black45),
              title: Text("Geri Bildirim"),
            ),
          ),
          Container(
            height: 35,
            child: ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.black45),
              title: Text("Çıkış Yap"),
              onTap: () {
                ref.read(loginControllerProvider.notifier).logout();
              },
            ),
          ),
          ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 30,
                width: 30,
                child:  true
                    ? Image.asset(ImagePath.user_male)
                    : Image.asset(ImagePath.user_female),
              ),
            ),
            title: Text(_user?.name ?? ""), // Update this line
            subtitle: Text(_user?.email ?? ""), // Update this line
          ),
        ],
      ),
    );
  }
}