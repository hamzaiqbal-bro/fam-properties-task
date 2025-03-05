// presentation/bloc/building_state.dart
import 'package:fam_properties/domain/entities/building_entity.dart';

abstract class BuildingState {}

class BuildingInitial extends BuildingState {}

class BuildingLoading extends BuildingState {}

class BuildingLoaded extends BuildingState {
  final List<BuildingEntity> buildings;
  BuildingLoaded(this.buildings);
}

class BuildingError extends BuildingState {
  final String message;
  BuildingError(this.message);
}
