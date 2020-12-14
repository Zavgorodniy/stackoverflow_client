import 'package:stackoverflow_client/error/base_error.dart';

class BaseListState<T> {
  List<T> data;
  BaseException error;

  BaseListState(this.data, {String error});
}