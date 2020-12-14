import 'package:get_it/get_it.dart';
import 'package:stackoverflow_client/data/provider/question_data_provider.dart';
import 'package:stackoverflow_client/data/provider/tag_data_provider.dart';
import 'package:stackoverflow_client/network/api_client.dart';
import 'package:stackoverflow_client/network/source/question_data_source.dart';
import 'package:stackoverflow_client/network/source/tag_data_source.dart';

final GetIt locator = GetIt.instance;

void setupProjectDependencies() {
  locator
    ..registerLazySingleton<ApiClient>(() => ApiClient())
    ..registerLazySingleton<QuestionsDataProvider>(() => QuestionsDataProviderImpl())
    ..registerLazySingleton<TagDataProvider>(() => TagDataProviderImpl())
    ..registerLazySingleton<TagDataSource>(() => TagDataSource())
    ..registerLazySingleton<QuestionDataSource>(() => QuestionDataSource());
}