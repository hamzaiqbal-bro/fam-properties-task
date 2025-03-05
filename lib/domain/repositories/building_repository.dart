// domain/repositories/building_repository.dart
import '../entities/building_entity.dart';

abstract class BuildingRepository {
  Future<List<BuildingEntity>> getBuildings();
}
