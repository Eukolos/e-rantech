import 'package:erantech/generated/json/base/json_field.dart';
import 'package:erantech/generated/json/salesman_goal_achieved_entity.g.dart';
import 'dart:convert';
export 'package:erantech/generated/json/salesman_goal_achieved_entity.g.dart';

@JsonSerializable()
class SalesmanGoalAchievedEntity {
	String? salesman;
	double? achieve;
	double? goal;
	double? rate;

	SalesmanGoalAchievedEntity();

	factory SalesmanGoalAchievedEntity.fromJson(Map<String, dynamic> json) => $SalesmanGoalAchievedEntityFromJson(json);

	Map<String, dynamic> toJson() => $SalesmanGoalAchievedEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}