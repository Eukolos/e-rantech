import 'package:erantech/generated/json/base/json_convert_content.dart';
import 'package:erantech/src/models/salesman_goal_achieved_entity.dart';

SalesmanGoalAchievedEntity $SalesmanGoalAchievedEntityFromJson(
    Map<String, dynamic> json) {
  final SalesmanGoalAchievedEntity salesmanGoalAchievedEntity = SalesmanGoalAchievedEntity();
  final String? salesman = jsonConvert.convert<String>(json['salesman']);
  if (salesman != null) {
    salesmanGoalAchievedEntity.salesman = salesman;
  }
  final double? achieve = jsonConvert.convert<double>(json['achieve']);
  if (achieve != null) {
    salesmanGoalAchievedEntity.achieve = achieve;
  }
  final double? goal = jsonConvert.convert<double>(json['goal']);
  if (goal != null) {
    salesmanGoalAchievedEntity.goal = goal;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    salesmanGoalAchievedEntity.rate = rate;
  }
  return salesmanGoalAchievedEntity;
}

Map<String, dynamic> $SalesmanGoalAchievedEntityToJson(
    SalesmanGoalAchievedEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['salesman'] = entity.salesman;
  data['achieve'] = entity.achieve;
  data['goal'] = entity.goal;
  data['rate'] = entity.rate;
  return data;
}

extension SalesmanGoalAchievedEntityExtension on SalesmanGoalAchievedEntity {
  SalesmanGoalAchievedEntity copyWith({
    String? salesman,
    double? achieve,
    double? goal,
    double? rate,
  }) {
    return SalesmanGoalAchievedEntity()
      ..salesman = salesman ?? this.salesman
      ..achieve = achieve ?? this.achieve
      ..goal = goal ?? this.goal
      ..rate = rate ?? this.rate;
  }
}