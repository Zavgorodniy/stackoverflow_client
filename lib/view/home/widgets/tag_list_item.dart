import 'package:flutter/material.dart';
import 'package:stackoverflow_client/data/model/tag.dart';
import 'package:stackoverflow_client/network/network_constants.dart';

class TagListItem extends StatelessWidget {
  final Tag item;
  final Function(String) onTap;

  const TagListItem(this.item, this.onTap);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => onTap(item.name),
    child: Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name),
            if (item.name == NetworkConstants.specialTag)
              Icon(Icons.android),
            Text(item.count.toString())
          ],
        ),
      ),
    ),
  );

}