// domain/entities/building_entity.dart
class BuildingEntity {
  final int buildingId;
  final String buildingName;
  final String developerName;
  final String areaName;
  final int startingPrice;
  final String buildingLaunchDate;

  BuildingEntity({
    required this.buildingId,
    required this.buildingName,
    required this.developerName,
    required this.areaName,
    required this.startingPrice,
    required this.buildingLaunchDate,
  });
}
