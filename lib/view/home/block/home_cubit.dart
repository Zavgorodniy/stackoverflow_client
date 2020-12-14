import 'package:stackoverflow_client/bloc/base_list_cubit.dart';
import 'package:stackoverflow_client/data/model/tag.dart';
import 'package:stackoverflow_client/data/provider/tag_data_provider.dart';
import 'package:stackoverflow_client/managers/locator.dart';
import 'package:stackoverflow_client/network/network_constants.dart';

class HomeCubit extends BaseListCubit<Tag> {

  final sort = TagSortType.popular;

  @override
  TagDataProvider get dataProvider => locator<TagDataProvider>();

  @override
  String getQuery() => 'sort=${sort.typeStr}';
}

enum TagSortType { popular, activity, name }

extension TagSortTypeExtension on TagSortType {
  String get typeStr {
    switch (this) {
      case TagSortType.activity:
        return NetworkConstants.activity;
      case TagSortType.name:
        return NetworkConstants.name;
      default:
        return NetworkConstants.popular;
    }
  }
}
