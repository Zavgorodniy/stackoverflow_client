import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stackoverflow_client/bloc/base_state.dart';
import 'package:stackoverflow_client/data/provider/base_list_provider.dart';
import 'package:stackoverflow_client/error/base_error.dart';
import 'package:stackoverflow_client/network/network_constants.dart';

abstract class BaseListCubit<T> extends Cubit<BaseListState<T>> {
  int _page = 1;
  String _query;
  bool _isLoading = false;

  BaseListProvider<T> get dataProvider;

  int pagesize = NetworkConstants.itemsPerPageDefault;
  OrderType listOrder = OrderType.desc;

  BaseListCubit() : super(BaseListState(<T>[])) {
    getData();
  }

  String getQuery();

  String _getFullQuery() {
    _query ??= '&pagesize=$pagesize&order=${listOrder.typeStr}&site=stackoverflow&${getQuery()}';
    return '?page=$_page$_query';
  }

  Future<List<T>> _dataRequest() => dataProvider.getData(_getFullQuery());

  // TODO
  void processErrors(BaseException ex) {
    state.error = ex;
    emit(BaseListState(state.data, error: ex.message));
  }

  @mustCallSuper
  void getData() async {
    if (!_isLoading) {
      _isLoading = true;
      final data = await _dataRequest();
      if (data.isNotEmpty) {
        state.data.addAll(data);
        _page++;
      } else {
        if (_page == 1) {
          state.data.clear();
        }
      }
      emit(BaseListState(state.data));
      _isLoading = false;
    }
  }
}

enum OrderType { asc, desc }

extension OrderTypeExtension on OrderType {
  String get typeStr {
    switch (this) {
      case OrderType.asc:
        return NetworkConstants.asc;
      default:
        return NetworkConstants.desc;
    }
  }
}
