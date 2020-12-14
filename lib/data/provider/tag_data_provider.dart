import 'package:stackoverflow_client/data/model/tag.dart';
import 'package:stackoverflow_client/data/provider/base_list_provider.dart';
import 'package:stackoverflow_client/managers/locator.dart';
import 'package:stackoverflow_client/network/source/tag_data_source.dart';

abstract class TagDataProvider extends BaseListProvider<Tag> {}

class TagDataProviderImpl extends TagDataProvider {
  final TagDataSource _dataSource = locator<TagDataSource>();

  @override
  Future<List<Tag>> getData(String query) => _dataSource.getAllTags(query);
}
