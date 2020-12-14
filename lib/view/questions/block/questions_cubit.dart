import 'package:stackoverflow_client/bloc/base_list_cubit.dart';
import 'package:stackoverflow_client/data/model/question.dart';
import 'package:stackoverflow_client/data/provider/question_data_provider.dart';
import 'package:stackoverflow_client/managers/locator.dart';
import 'package:stackoverflow_client/network/network_constants.dart';

class QuestionsCubit extends BaseListCubit<Question> {

  final sort = QuestionSortType.votes;
  final String tag;

  QuestionsCubit(this.tag) : super();

  @override
  QuestionsDataProvider get dataProvider => locator<QuestionsDataProvider>();

  @override
  String getQuery() => 'sort=${sort.typeStr}&tagged=$tag';
}

enum QuestionSortType { activity, votes, creation, hot, week, month }

extension QuestionSortTypeExtension on QuestionSortType {
  String get typeStr {
    switch (this) {
      case QuestionSortType.activity:
        return NetworkConstants.activity;
      case QuestionSortType.creation:
        return NetworkConstants.creation;
      case QuestionSortType.creation:
        return NetworkConstants.hot;
      case QuestionSortType.creation:
        return NetworkConstants.week;
      case QuestionSortType.creation:
        return NetworkConstants.month;
      default:
        return NetworkConstants.votes;
    }
  }
}
