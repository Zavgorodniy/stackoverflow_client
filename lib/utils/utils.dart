import 'package:intl/intl.dart';

Map safeGetMap(dynamic data) => data != null && data is Map ? data : {};

List safeGetList(dynamic data) => data != null && data is List ? data : [];

String formatDate(DateTime date) => '${DateFormat('EEE, MMM d').format(date)}';

