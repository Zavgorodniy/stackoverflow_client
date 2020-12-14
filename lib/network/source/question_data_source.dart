import 'package:stackoverflow_client/data/model/question.dart';
import 'package:stackoverflow_client/managers/locator.dart';
import 'package:stackoverflow_client/network/api_client.dart';
import 'package:stackoverflow_client/network/network_constants.dart';
import 'package:stackoverflow_client/utils/utils.dart';

class QuestionDataSource {
  final ApiClient _dio = locator<ApiClient>();

  Future<List<Question>> getQuestions(String query) async {
    final response =
        await _dio.get('${NetworkConstants.questionsEndpoint}$query');
    final data = response.data[NetworkConstants.itemsApiKey];
    return safeGetList(data)
        .map<Question>((json) => Question.fromJson(json))
        .toList();
  }
}
