import 'package:erantech/src/widgets/app_bar.dart';
import 'package:erantech/src/widgets/large_screen.dart';
import 'package:erantech/src/widgets/menu_items.dart';
import 'package:erantech/src/widgets/menu_user.dart';
import 'package:erantech/src/widgets/salesman_goal_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/responsiveness.dart';
import '../widgets/goal_chart.dart';
import '../widgets/salesman_match_chart.dart';

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
              flex: 3,
              child: MenuItems(
                isDrawer: true,
              ),
            ),
            const MenuUserWidget(),
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
            widget: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width -300,
                color: const Color(0xffF6F6F6),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width:800, child: SalesmanGoalChartWidget()),
                        SizedBox(
                          height: 20,),
                        GoalChartWidget(),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height:400 ,child: SalesmanMatchChartWidget())
                      ]
                    ),

                  ],
                ),
              ),
            ),
          ),
          smallScreen: SingleChildScrollView(
            child: Container(
              //hex color
              color: const Color(0xffF6F6F6),
              child: Column(
                children: [
                        Container( child: const SalesmanGoalChartWidget()),
                        const SizedBox(
                          height: 20,),
                        const GoalChartWidget(),
            
                ],
              ),
            ),
          ),),
    );
  }
}

