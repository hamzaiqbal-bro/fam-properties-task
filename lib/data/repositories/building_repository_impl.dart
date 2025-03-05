// data/repositories/building_repository_impl.dart
import 'package:fam_properties/domain/entities/building_entity.dart';
import 'package:fam_properties/domain/repositories/building_repository.dart';
import '../datasources/building_remote_data_source.dart';

class BuildingRepositoryImpl implements BuildingRepository {
  final BuildingRemoteDataSource remoteDataSource;

  BuildingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BuildingEntity>> getBuildings() async {
    return await remoteDataSource.getBuildings();
  }
}
