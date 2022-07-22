class NewTaskModel {
  final String title;
  final String description;
  final String color;
  NewTaskModel({
    required this.title,
    required this.description,
    required this.color,
  });

  NewTaskModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        color = json['color'];

  Map toJson() {
    return {'title': title, 'description': description, 'color': color};
  }
}
