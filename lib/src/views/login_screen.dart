import 'package:erantech/src/helpers/responsiveness.dart';
import 'package:erantech/src/providers/login_controller_provider.dart';
import 'package:erantech/src/providers/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginState = ref.watch(loginControllerProvider);

    return Scaffold(
        body: ResponsiveWidget(
      largeScreen: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    height: double.infinity, color: Colors.transparent)),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: const BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[

                        Container(
                            alignment: Alignment.center,
                            height: 200,
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/images/logo.png")),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Ayz Yedek Parça Paz. Ltd. Şti.',
                              style: TextStyle(fontSize: 20),
                            )),

                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: 'Şifre',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text(
                                'Giriş Yapınız',
                                style: TextStyle(color: Colors.white70),
                              ),
                              onPressed: () {
                                ref.read(loginControllerProvider.notifier).login(
                                    emailController.text,
                                    passwordController.text);
                              },
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        if(loginState is LoginStateError)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(loginState.error, style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w400),),
                          ),
                        if(loginState is !LoginStateError)
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(""),
                          ),
                        if(loginState is !LoginStateLoading)
                         const SizedBox(
                          height: 50,
                        ),
                        if(loginState is LoginStateLoading)
                          const SizedBox(
                            height: 50,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),),

                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),



      smallScreen: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_image.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.center,
                    height: 200,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/logo.png")),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Ayz Yedek Parça Paz. Ltd. Şti.',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'şifre',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Giriş Yapınız',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        ref
                            .read(loginControllerProvider.notifier)
                            .login(emailController.text, passwordController.text);
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                if(loginState is LoginStateError)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(loginState.error, style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w400),),
                  ),
                if(loginState is !LoginStateError)
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(""),
                  ),
                if(loginState is !LoginStateLoading)
                  const SizedBox(
                    height: 50,
                  ),
                if(loginState is LoginStateLoading)
                  const SizedBox(
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),),

              ],
            )),
      ),
    ));
  }
}
