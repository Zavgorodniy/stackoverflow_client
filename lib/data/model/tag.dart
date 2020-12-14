class Tag {
  String name;
  int count;

  Tag.fromJson(Map<String, dynamic> json) :
    name = json['name'],
    count = json['count'];
}
