import 'package:flutter/material.dart';

mixin PaginationManager {
  bool onScroll(ScrollNotification scrollInfo, Function callback) {
    if (scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.extentAfter == 0) {
      callback();
    }
    return true;
  }
}
