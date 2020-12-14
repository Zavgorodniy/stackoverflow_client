abstract class BaseListProvider<T> {
  Future<List<T>> getData(String query);
}
