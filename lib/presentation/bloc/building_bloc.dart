// presentation/bloc/building_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'building_event.dart';
import 'building_state.dart';
import 'package:fam_properties/domain/usecases/get_buildings.dart';

class BuildingBloc extends Bloc<BuildingEvent, BuildingState> {
  final GetBuildings getBuildings;

  BuildingBloc(this.getBuildings) : super(BuildingInitial()) {
    on<GetBuildingsEvent>((event, emit) async {
      emit(BuildingLoading());
      try {
        final buildings = await getBuildings();
        emit(BuildingLoaded(buildings));
      } catch (e) {
        emit(BuildingError(e.toString()));
      }
    });
  }
}
