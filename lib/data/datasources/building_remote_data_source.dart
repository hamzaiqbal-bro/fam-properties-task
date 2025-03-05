// data/datasources/building_remote_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/building_model.dart';

abstract class BuildingRemoteDataSource {
  Future<List<BuildingModel>> getBuildings();
}

class BuildingRemoteDataSourceImpl implements BuildingRemoteDataSource {
  final http.Client client;

  BuildingRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BuildingModel>> getBuildings() async {
    final url = 'https://fam-erp.com/property/test/Building/en/ALL/ALL/ALL/ALL/ALL/ALL/ALL/ALL/ALL/ALL/SEQ/0/0/0';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      final List<dynamic> items = jsonMap['items'] ?? [];
      return BuildingModel.fromJsonList(items);
    } else {
      throw Exception('Failed to load buildings');
    }
  }
}
