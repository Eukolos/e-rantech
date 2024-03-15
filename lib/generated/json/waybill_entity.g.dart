import 'package:erantech/generated/json/base/json_convert_content.dart';
import 'package:erantech/src/models/waybill_entity.dart';

WaybillEntity $WaybillEntityFromJson(Map<String, dynamic> json) {
  final WaybillEntity waybillEntity = WaybillEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    waybillEntity.id = id;
  }
  final String? waybillNumber = jsonConvert.convert<String>(
      json['waybillNumber']);
  if (waybillNumber != null) {
    waybillEntity.waybillNumber = waybillNumber;
  }
  final String? isExport = jsonConvert.convert<String>(json['isExport']);
  if (isExport != null) {
    waybillEntity.isExport = isExport;
  }
  final String? waybillDockDate = jsonConvert.convert<String>(
      json['waybillDockDate']);
  if (waybillDockDate != null) {
    waybillEntity.waybillDockDate = waybillDockDate;
  }
  final double? waybillType = jsonConvert.convert<double>(json['waybillType']);
  if (waybillType != null) {
    waybillEntity.waybillType = waybillType;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    waybillEntity.price = price;
  }
  final double? grossTotal = jsonConvert.convert<double>(json['grossTotal']);
  if (grossTotal != null) {
    waybillEntity.grossTotal = grossTotal;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    waybillEntity.currency = currency;
  }
  final double? exchangeRate = jsonConvert.convert<double>(
      json['exchangeRate']);
  if (exchangeRate != null) {
    waybillEntity.exchangeRate = exchangeRate;
  }
  final WaybillSalesman? salesman = jsonConvert.convert<WaybillSalesman>(
      json['salesman']);
  if (salesman != null) {
    waybillEntity.salesman = salesman;
  }
  final WaybillCompany? company = jsonConvert.convert<WaybillCompany>(
      json['company']);
  if (company != null) {
    waybillEntity.company = company;
  }
  return waybillEntity;
}

Map<String, dynamic> $WaybillEntityToJson(WaybillEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['waybillNumber'] = entity.waybillNumber;
  data['isExport'] = entity.isExport;
  data['waybillDockDate'] = entity.waybillDockDate;
  data['waybillType'] = entity.waybillType;
  data['price'] = entity.price;
  data['grossTotal'] = entity.grossTotal;
  data['currency'] = entity.currency;
  data['exchangeRate'] = entity.exchangeRate;
  data['salesman'] = entity.salesman?.toJson();
  data['company'] = entity.company?.toJson();
  return data;
}

extension WaybillEntityExtension on WaybillEntity {
  WaybillEntity copyWith({
    double? id,
    String? waybillNumber,
    String? isExport,
    String? waybillDockDate,
    double? waybillType,
    double? price,
    double? grossTotal,
    String? currency,
    double? exchangeRate,
    WaybillSalesman? salesman,
    WaybillCompany? company,
  }) {
    return WaybillEntity()
      ..id = id ?? this.id
      ..waybillNumber = waybillNumber ?? this.waybillNumber
      ..isExport = isExport ?? this.isExport
      ..waybillDockDate = waybillDockDate ?? this.waybillDockDate
      ..waybillType = waybillType ?? this.waybillType
      ..price = price ?? this.price
      ..grossTotal = grossTotal ?? this.grossTotal
      ..currency = currency ?? this.currency
      ..exchangeRate = exchangeRate ?? this.exchangeRate
      ..salesman = salesman ?? this.salesman
      ..company = company ?? this.company;
  }
}

WaybillSalesman $WaybillSalesmanFromJson(Map<String, dynamic> json) {
  final WaybillSalesman waybillSalesman = WaybillSalesman();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    waybillSalesman.id = id;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    waybillSalesman.code = code;
  }
  final String? definition = jsonConvert.convert<String>(json['definition']);
  if (definition != null) {
    waybillSalesman.definition = definition;
  }
  return waybillSalesman;
}

Map<String, dynamic> $WaybillSalesmanToJson(WaybillSalesman entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['code'] = entity.code;
  data['definition'] = entity.definition;
  return data;
}

extension WaybillSalesmanExtension on WaybillSalesman {
  WaybillSalesman copyWith({
    double? id,
    String? code,
    String? definition,
  }) {
    return WaybillSalesman()
      ..id = id ?? this.id
      ..code = code ?? this.code
      ..definition = definition ?? this.definition;
  }
}

WaybillCompany $WaybillCompanyFromJson(Map<String, dynamic> json) {
  final WaybillCompany waybillCompany = WaybillCompany();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    waybillCompany.id = id;
  }
  final String? companyCode = jsonConvert.convert<String>(json['companyCode']);
  if (companyCode != null) {
    waybillCompany.companyCode = companyCode;
  }
  final String? companyName = jsonConvert.convert<String>(json['companyName']);
  if (companyName != null) {
    waybillCompany.companyName = companyName;
  }
  final String? companyCyphCode = jsonConvert.convert<String>(
      json['companyCyphCode']);
  if (companyCyphCode != null) {
    waybillCompany.companyCyphCode = companyCyphCode;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    waybillCompany.city = city;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    waybillCompany.country = country;
  }
  return waybillCompany;
}

Map<String, dynamic> $WaybillCompanyToJson(WaybillCompany entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['companyCode'] = entity.companyCode;
  data['companyName'] = entity.companyName;
  data['companyCyphCode'] = entity.companyCyphCode;
  data['city'] = entity.city;
  data['country'] = entity.country;
  return data;
}

extension WaybillCompanyExtension on WaybillCompany {
  WaybillCompany copyWith({
    double? id,
    String? companyCode,
    String? companyName,
    String? companyCyphCode,
    String? city,
    String? country,
  }) {
    return WaybillCompany()
      ..id = id ?? this.id
      ..companyCode = companyCode ?? this.companyCode
      ..companyName = companyName ?? this.companyName
      ..companyCyphCode = companyCyphCode ?? this.companyCyphCode
      ..city = city ?? this.city
      ..country = country ?? this.country;
  }
}