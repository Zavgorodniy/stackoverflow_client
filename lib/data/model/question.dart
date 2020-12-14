import 'package:stackoverflow_client/utils/utils.dart';

class Question {
  int id;
  String title;
  DateTime date;
  String author;

  Question.fromJson(Map<String, dynamic> json)
      : id = json['question_id'],
        title = json['title'],
        date = DateTime.fromMillisecondsSinceEpoch(json['creation_date']),
        author = safeGetMap(json['owner'])['display_name'];
}
