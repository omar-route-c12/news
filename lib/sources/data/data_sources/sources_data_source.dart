import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/shared/api_constants.dart';
import 'package:news/sources/data/models/sources_response.dart';

class SourcesDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.sourcesEndpoint,
      {
        'apiKey': APIConstants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}
