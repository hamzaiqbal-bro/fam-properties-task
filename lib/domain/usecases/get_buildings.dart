// domain/usecases/get_buildings.dart
import '../entities/building_entity.dart';
import '../repositories/building_repository.dart';

class GetBuildings {
  final BuildingRepository repository;

  GetBuildings(this.repository);

  Future<List<BuildingEntity>> call() async {
    return await repository.getBuildings();
  }
}
