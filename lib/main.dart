// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'domain/repositories/building_repository.dart';
import 'data/datasources/building_remote_data_source.dart';
import 'data/repositories/building_repository_impl.dart';
import 'presentation/pages/building_page.dart';

void main() {
  final client = http.Client();
  final remoteDataSource = BuildingRemoteDataSourceImpl(client: client);
  final buildingRepository = BuildingRepositoryImpl(remoteDataSource: remoteDataSource);

  runApp(MyApp(buildingRepository: buildingRepository));
}

class MyApp extends StatelessWidget {
  final BuildingRepository buildingRepository;

  const MyApp({Key? key, required this.buildingRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: buildingRepository,
      child: MaterialApp(
        title: 'FAM Properties',
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: const BuildingPage(),
      ),
    );
  }
}
