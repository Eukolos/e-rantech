import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/goal_provider.dart';

class SalesmanGoalChartWidget extends ConsumerStatefulWidget {
  SalesmanGoalChartWidget({Key? key}) : super(key: key);

  final shadowColor = const Color(0xFFCCCCCC);

  @override
  ConsumerState<SalesmanGoalChartWidget> createState() => _SalesmanGoalChartWidgetState();
}

class _SalesmanGoalChartWidgetState extends ConsumerState<SalesmanGoalChartWidget> {
  BarChartGroupData generateBarGroup(
      int x,
      Color color,
      double value,
      double shadowValue,
      ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: color,
          width: 8,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: widget.shadowColor,
          width: 8,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final goalFuture = ref.watch(goalProvider);
        return goalFuture.when(
          data: (dataList) {
            final barDataList = dataList.map((data) {
              return _BarData(
                Colors.yellow, // You can change this to different colors based on your needs
                data.achieve ?? 0,
                data.goal ?? 0,
                data.salesman ?? '',
              );
            }).toList();

            return Padding(
              padding: const EdgeInsets.all(24),
              child: AspectRatio(
                aspectRatio: 1.4,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    // ... rest of your chart configuration
                    barGroups: barDataList.asMap().entries.map((e) {
                      final index = e.key;
                      final data = e.value;
                      return generateBarGroup(
                        index,
                        data.color,
                        data.value,
                        data.shadowValue,
                      );
                    }).toList(),
                    // ... rest of your chart configuration
                  ),
                ),
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}


// class SalesmanGoalChartWidget extends ConsumerStatefulWidget {
//   SalesmanGoalChartWidget({super.key});
//
//   final shadowColor = const Color(0xFFCCCCCC);
//   final dataList = [
//     const _BarData(Colors.yellow, 18, 18, "Rıdvan"),
//     const _BarData(Colors.green, 17, 8, "Irving"),
//     const _BarData(Colors.orange, 10, 15, "Arif Emre"),
//     const _BarData(Colors.pink, 2.5, 5, "A. Emre Balkan"),
//     const _BarData(Colors.blue, 2, 2.5, "Rıdvan"),
//     const _BarData(Colors.red, 2, 2, "Rıdvan"),
//   ];
//
//   @override
//   ConsumerState<SalesmanGoalChartWidget> createState() => _SalesmanGoalChartWidgetState();
// }
//
// class _SalesmanGoalChartWidgetState extends ConsumerState<SalesmanGoalChartWidget> {
//   BarChartGroupData generateBarGroup(
//       int x,
//       Color color,
//       double value,
//       double shadowValue,
//       ) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: value,
//           color: color,
//           width: 8,
//         ),
//         BarChartRodData(
//           toY: shadowValue,
//           color: widget.shadowColor,
//           width: 8,
//         ),
//       ],
//       showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
//     );
//   }
//
//   int touchedGroupIndex = -1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24),
//       child: AspectRatio(
//         aspectRatio: 1.4,
//         child: BarChart(
//           BarChartData(
//             alignment: BarChartAlignment.spaceBetween,
//             borderData: FlBorderData(
//               show: true,
//               border: Border.symmetric(
//                 horizontal: BorderSide(
//                   color: Colors.black45.withOpacity(0.2),
//                 ),
//               ),
//             ),
//             titlesData: FlTitlesData(
//               show: true,
//               leftTitles: AxisTitles(
//                 drawBelowEverything: true,
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 30,
//                   getTitlesWidget: (value, meta) {
//                     return Text(
//                       value.toInt().toString(),
//                       textAlign: TextAlign.left,
//                     );
//                   },
//                 ),
//               ),
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   reservedSize: 36,
//                   getTitlesWidget: (value, meta) {
//                     final index = value.toInt();
//                     return SideTitleWidget(
//                       axisSide: meta.axisSide,
//                       child: _IconWidget(
//                         salesmanName: widget.dataList[index].salesmanName,
//                         color: widget.dataList[index].color,
//                         isSelected: touchedGroupIndex == index,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               rightTitles: const AxisTitles(),
//               topTitles: const AxisTitles(),
//             ),
//             gridData: FlGridData(
//               show: true,
//               drawVerticalLine: false,
//               getDrawingHorizontalLine: (value) => FlLine(
//                 color: Colors.black45.withOpacity(0.2),
//                 strokeWidth: 1,
//               ),
//             ),
//             barGroups: widget.dataList.asMap().entries.map((e) {
//               final index = e.key;
//               final data = e.value;
//               return generateBarGroup(
//                 index,
//                 data.color,
//                 data.value,
//                 data.shadowValue,
//               );
//             }).toList(),
//             maxY: 20,
//             barTouchData: BarTouchData(
//               enabled: true,
//               handleBuiltInTouches: false,
//               touchTooltipData: BarTouchTooltipData(
//                 tooltipBgColor: Colors.transparent,
//                 tooltipMargin: 0,
//                 getTooltipItem: (
//                     BarChartGroupData group,
//                     int groupIndex,
//                     BarChartRodData rod,
//                     int rodIndex,
//                     ) {
//                   return BarTooltipItem(
//                     rod.toY.toString(),
//                     TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: rod.color,
//                       fontSize: 18,
//                       shadows: const [
//                         Shadow(
//                           color: Colors.black26,
//                           blurRadius: 12,
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               touchCallback: (event, response) {
//                 if (event.isInterestedForInteractions &&
//                     response != null &&
//                     response.spot != null) {
//                   setState(() {
//                     touchedGroupIndex = response.spot!.touchedBarGroupIndex;
//                   });
//                 } else {
//                   setState(() {
//                     touchedGroupIndex = -1;
//                   });
//                 }
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _BarData {
//   const _BarData(this.color, this.value, this.shadowValue, this.salesmanName);
//   final Color color;
//   final double value;
//   final double shadowValue;
//   final String salesmanName;
// }
//
// class _IconWidget extends ImplicitlyAnimatedWidget {
//   const _IconWidget({
//     required this.color,
//     required this.isSelected,
//     required this.salesmanName,
//   }) : super(duration: const Duration(milliseconds: 300));
//   final Color color;
//   final bool isSelected;
//   final String salesmanName;
//
//   @override
//   ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
//       _IconWidgetState();
// }
//
// class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
//   Tween<double>? _rotationTween;
//
//   @override
//   Widget build(BuildContext context) {
//     final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
//     final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
//     return Transform(
//       transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
//       origin: const Offset(14, 14),
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Text(
//             widget.salesmanName,
//             style: TextStyle(
//               fontSize: 12, // adjust font size as needed
//               color: Colors.black, // adjust color as needed
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void forEachTween(TweenVisitor<dynamic> visitor) {
//     _rotationTween = visitor(
//       _rotationTween,
//       widget.isSelected ? 1.0 : 0.0,
//           (dynamic value) => Tween<double>(
//         begin: value as double,
//         end: widget.isSelected ? 1.0 : 0.0,
//       ),
//     ) as Tween<double>?;
//   }
// }