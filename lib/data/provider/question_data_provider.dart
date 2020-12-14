import 'package:stackoverflow_client/data/model/question.dart';
import 'package:stackoverflow_client/data/provider/base_list_provider.dart';
import 'package:stackoverflow_client/managers/locator.dart';
import 'package:stackoverflow_client/network/source/question_data_source.dart';

abstract class QuestionsDataProvider extends BaseListProvider<Question> {}

class QuestionsDataProviderImpl extends QuestionsDataProvider {
  final QuestionDataSource _dataSource = locator<QuestionDataSource>();

  @override
  Future<List<Question>> getData(String query) =>
      _dataSource.getQuestions(query);
}
