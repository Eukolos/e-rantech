import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/salesmen_goal_provider.dart';

class SalesmanGoalChartWidget extends ConsumerStatefulWidget {
  const SalesmanGoalChartWidget({Key? key}) : super(key: key);

  final shadowColor = const Color(0xFFCCCCCC);

  @override
  ConsumerState<SalesmanGoalChartWidget> createState() =>
      _SalesmanGoalChartWidgetState();
}

class _SalesmanGoalChartWidgetState
    extends ConsumerState<SalesmanGoalChartWidget> {
  late Future<List<_BarData>> goalFuture;

  @override
  void initState() {
    super.initState();
    goalFuture = fetchData();
  }

  Future<List<_BarData>> fetchData() async {
    final dataList = await ref.read(salesmanGoalProvider.future);
    return dataList.map((data) {
      return _BarData(
        data.achieve ?? 0,
        data.goal ?? 0,
        data.salesman ?? '',
      );
    }).toList();
  }

  BarChartGroupData generateBarGroup(
    int x,
    double value,
    double shadowValue,
  ) {
    final List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.indigo,
    ];
    return BarChartGroupData(
      x: x,
      barsSpace: 6,
      barRods: [
        BarChartRodData(
          toY: value,
          color: colors[x % 10],
          width: 18,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: widget.shadowColor,
          width: 20,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<_BarData>>(
      future: goalFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final barDataList = snapshot.data!;
          //find biggest value
          double goal = barDataList.fold(
              0, (previousValue, element) => previousValue + element.value);
          // floor the value to the nearest example 348100 to 400000
          goal = (goal / 100000).ceilToDouble() * 100000;
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              height: 400,
              width: 900,
              child: BarChart(
                BarChartData(
                  groupsSpace: 80,
                  alignment: BarChartAlignment.spaceBetween,
                  borderData: FlBorderData(
                    show: true,
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.black45.withOpacity(0.8),
                      ),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 70,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: _IconWidget(
                              salesmanName: barDataList[index].salesmanName,
                              color: widget.shadowColor,
                              isSelected: touchedGroupIndex == index,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.black45.withOpacity(0.2),
                      strokeWidth: 1,
                    ),
                  ),
                  barGroups: barDataList.asMap().entries.map((e) {
                    final index = e.key;
                    final data = e.value;
                    return generateBarGroup(
                        index, data.value, data.shadowValue);
                  }).toList(),
                  maxY: goal ?? 20,
                  barTouchData: BarTouchData(
                    enabled: true,
                    handleBuiltInTouches: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          rod.toY.toString(),
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18,
                            shadows: const [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 12,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    touchCallback: (event, response) {
                      if (event.isInterestedForInteractions &&
                          response != null &&
                          response.spot != null) {
                        setState(() {
                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;
                        });
                      } else {
                        setState(() {
                          touchedGroupIndex = -1;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class _BarData {
  const _BarData(this.value, this.shadowValue, this.salesmanName);

  final double value;
  final double shadowValue;
  final String salesmanName;
}

class _IconWidget extends ImplicitlyAnimatedWidget {
  const _IconWidget({
    required this.color,
    required this.isSelected,
    required this.salesmanName,
  }) : super(duration: const Duration(milliseconds: 300));
  final Color color;
  final bool isSelected;
  final String salesmanName;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _IconWidgetState();
}

class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
  Tween<double>? _rotationTween;

  @override
  Widget build(BuildContext context) {
    final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
    final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
    return Transform(
      transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
      origin: const Offset(14, 14),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: widget.salesmanName.split(" ").first,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: "\n"), // Bir alt satıra geçmek için boşluk ekleyelim
            TextSpan(
              // split first and took others
              text: widget.salesmanName.split(" ").sublist(1).join(" "),
              style: TextStyle(
                color: Colors.black45,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _rotationTween = visitor(
      _rotationTween,
      widget.isSelected ? 2.0 : 0.0,
      (dynamic value) => Tween<double>(
        begin: value as double,
        end: widget.isSelected ? 2.0 : 0.0,
      ),
    ) as Tween<double>?;
  }
}
