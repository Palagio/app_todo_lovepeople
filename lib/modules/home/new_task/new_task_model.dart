class NewTaskModel {
  final String title;
  final String description;
  final String color;
  final int id;
  NewTaskModel(
    this.id, {
    required this.title,
    required this.description,
    required this.color,
  });

  NewTaskModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        color = json['color'],
        id = json['id'];

  Map toJson() {
    return {'title': title, 'description': description, 'color': color, 'id': id};
  }
}
