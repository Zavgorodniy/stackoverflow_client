import 'package:stackoverflow_client/data/model/tag.dart';
import 'package:stackoverflow_client/managers/locator.dart';
import 'package:stackoverflow_client/network/api_client.dart';
import 'package:stackoverflow_client/network/network_constants.dart';
import 'package:stackoverflow_client/utils/utils.dart';

class TagDataSource {
  final ApiClient _dio = locator<ApiClient>();

  Future<List<Tag>> getAllTags(String query) async {
    final response = await _dio.get('${NetworkConstants.tagEndpoint}$query');
    final data = response.data[NetworkConstants.itemsApiKey];
    return safeGetList(data).map<Tag>((json) => Tag.fromJson(json)).toList();
  }
}
