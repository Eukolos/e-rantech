import 'package:erantech/generated/json/base/json_field.dart';
import 'package:erantech/generated/json/waybill_entity.g.dart';
import 'dart:convert';
export 'package:erantech/generated/json/waybill_entity.g.dart';

@JsonSerializable()
class WaybillEntity {
	double? id;
	String? waybillNumber;
	String? isExport;
	String? waybillDockDate;
	double? waybillType;
	double? price;
	double? grossTotal;
	String? currency;
	double? exchangeRate;
	WaybillSalesman? salesman;
	WaybillCompany? company;

	WaybillEntity();

	factory WaybillEntity.fromJson(Map<String, dynamic> json) => $WaybillEntityFromJson(json);

	Map<String, dynamic> toJson() => $WaybillEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WaybillSalesman {
	double? id;
	String? code;
	String? definition;

	WaybillSalesman();

	factory WaybillSalesman.fromJson(Map<String, dynamic> json) => $WaybillSalesmanFromJson(json);

	Map<String, dynamic> toJson() => $WaybillSalesmanToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WaybillCompany {
	double? id;
	String? companyCode;
	String? companyName;
	String? companyCyphCode;
	String? city;
	String? country;

	WaybillCompany();

	factory WaybillCompany.fromJson(Map<String, dynamic> json) => $WaybillCompanyFromJson(json);

	Map<String, dynamic> toJson() => $WaybillCompanyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}