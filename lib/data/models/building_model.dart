// data/models/building_model.dart
import 'package:fam_properties/domain/entities/building_entity.dart';

class BuildingModel extends BuildingEntity {
  BuildingModel({
    required int buildingId,
    required String buildingName,
    required String developerName,
    required String areaName,
    required int startingPrice,
    required String buildingLaunchDate,
  }) : super(
    buildingId: buildingId,
    buildingName: buildingName,
    developerName: developerName,
    areaName: areaName,
    startingPrice: startingPrice,
    buildingLaunchDate: buildingLaunchDate,
  );

  factory BuildingModel.fromJson(Map<String, dynamic> json) {
    return BuildingModel(
      buildingId: json['building_id'] ?? 0,
      buildingName: json['building_name'] ?? '',
      developerName: json['developer_name'] ?? '',
      areaName: json['area_name'] ?? '',
      startingPrice: json['starting_price'] ?? 0,
      buildingLaunchDate: json['building_launch_date'] ?? '',
    );
  }

  static List<BuildingModel> fromJsonList(List<dynamic> list) {
    return list.map((item) => BuildingModel.fromJson(item)).toList();
  }
}
