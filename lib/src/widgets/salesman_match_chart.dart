import 'package:erantech/src/models/salesman_goal_achieved_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/image_path.dart';
import '../providers/salesmen_goal_provider.dart';

class SalesmanMatchChartWidget extends ConsumerStatefulWidget {
  const SalesmanMatchChartWidget({super.key});

  @override
  ConsumerState createState() => _SalesmanMatchChartWidgetState();
}

class _SalesmanMatchChartWidgetState extends ConsumerState<SalesmanMatchChartWidget> {
  late Future<List<PieChartSectionData>> goalFuture;
  int touchedIndex = -1;
  int setTouchedIndex(int index) {
    setState(() {
      touchedIndex = index;
    });
    return index;
  }

  @override
  void initState() {
    super.initState();
    goalFuture = fetchData();
  }

  Future<List<PieChartSectionData>> fetchData() async {
    List<SalesmanGoalAchievedEntity> dataList = await ref.read(salesmanGoalProvider.future);
    // not shadow copy need deep copy
    dataList = List<SalesmanGoalAchievedEntity>.from(dataList);
    // if achieve 0 remove from list
    dataList.removeWhere((element) => element.achieve == 0);
    double total = 0;
    for (var data in dataList) {
      total += data.achieve!;
    }
    return dataList.map((data) {
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
      // Update the isTouched condition based on touchedIndex
      final isTouched = dataList.indexOf(data) == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 220.0 : 200.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      final color = colors[dataList.indexOf(data) % colors.length];
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
        color: color,
        value: data.achieve!,
        title: '${(data.achieve! / total * 100).toStringAsFixed(0)}% ${data.salesman}',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
        badgeWidget: _Badge(data!.salesman!, size: widgetSize, borderColor: color, isMain: isTouched),
        badgePositionPercentageOffset: .98,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context)  {
    return FutureBuilder<List<PieChartSectionData>>(
      future: goalFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)  {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final sections = snapshot.data!;

          return AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1; // Reset touchedIndex
                        return;
                      }
                      touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: sections.map((section) {
                  final isTouched = sections.indexOf(section) == touchedIndex;
                  final fontSize = isTouched ? 20.0 : 16.0;
                  final radius = isTouched ? 160.0 : 140.0;
                  final widgetSize = isTouched ? 70.0 : 55.0;
                  final isMain = sections.indexOf(section) == touchedIndex;
                  final color = section.color;
                  const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                  return section.copyWith(
                    titleStyle: TextStyle(
                      fontSize: fontSize*1.3,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffffffff),
                      shadows: shadows,
                    ),
                    title: section.title!.split(" ").first,
                    badgeWidget: _Badge(section.title!.split(" ").last ?? '??', size: widgetSize , borderColor: color, isMain: isMain), // how can I pass the salesman name here?
                    badgePositionPercentageOffset: .98,
                    radius: radius,
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}


class _Badge extends StatefulWidget {
  const _Badge(
      this.salesmanName, {
        required this.size,
        required this.borderColor,
        required this.isMain
      });
  final bool isMain;
  final String salesmanName;
  final double size;
  final Color borderColor;

  @override
  State<_Badge> createState() => _BadgeState();
}

class _BadgeState extends State<_Badge> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: PieChart.defaultDuration,
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.borderColor,
              width: 2,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                offset: const Offset(3, 3),
                blurRadius: 3,
              ),
            ],
          ),
          padding: EdgeInsets.all(widget.size * .15),
          child: Center(
            child: SvgPicture.asset(ImagePath.salesman, width: widget.size * .6, height: widget.size * .6)
          ),
        ),
        const SizedBox(width: 6),
        if (widget.isMain)
          Text(widget.salesmanName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )
          )
      ],
    );
  }
}
