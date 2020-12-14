import 'package:flutter/material.dart';
import 'package:stackoverflow_client/data/model/question.dart';
import 'package:stackoverflow_client/utils/utils.dart';

class QuestionListItem extends StatelessWidget {
  final Question item;

  const QuestionListItem(this.item);

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(10),
    ),
    child: DefaultTextStyle(
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 16,
        children: [
          Text('# ${item.id.toString()}'),
          Text(item.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatDate(item.date)),
              Text(item.author),
            ],
          ),
        ],
      ),
    ),
  );
}