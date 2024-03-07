import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/goal_provider.dart';

class GoalChartWidget extends ConsumerStatefulWidget {
  const GoalChartWidget({super.key});

  @override
  ConsumerState createState() => _GoalChartWidgetState();
}

class _GoalChartWidgetState extends ConsumerState<GoalChartWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double>(
      future: ref.watch(goalProvider.future),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            height: 300,
            width: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text("HEDEF", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                PieChart(

                  swapAnimationDuration: const Duration(milliseconds: 800),
                  swapAnimationCurve: Curves.easeInOutQuint,
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.green,
                        value: snapshot.data,
                        title: '${snapshot.data}%',
                        radius: 100,
                        titleStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        color: Colors.red,
                        value: 100 - snapshot.data!,
                        title: '${100 - snapshot.data!}%',
                        radius: 100,
                        titleStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                ),
              ],
            ),
          );
        }
      },
    );
  }
}