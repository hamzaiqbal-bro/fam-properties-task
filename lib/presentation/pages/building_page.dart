// presentation/pages/building_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fam_properties/domain/repositories/building_repository.dart';
import 'package:fam_properties/domain/usecases/get_buildings.dart';
import 'package:fam_properties/presentation/bloc/building_bloc.dart';
import 'package:fam_properties/presentation/bloc/building_event.dart';
import 'package:fam_properties/presentation/bloc/building_state.dart';
import 'package:fam_properties/presentation/widgets/building_item.dart';

class BuildingPage extends StatelessWidget {
  const BuildingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BuildingBloc(
        GetBuildings(
          RepositoryProvider.of<BuildingRepository>(context),
        ),
      )..add(GetBuildingsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Buildings'),
          centerTitle: true,
        ),
        body: BlocBuilder<BuildingBloc, BuildingState>(
          builder: (context, state) {
            if (state is BuildingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BuildingLoaded) {
              return ListView.builder(
                itemCount: state.buildings.length,
                itemBuilder: (context, index) {
                  final building = state.buildings[index];
                  return BuildingItem(building: building);
                },
              );
            } else if (state is BuildingError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
