class TodoModel {
  final int id;
  final String title;
  final String description;
  final bool isDone;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isDone: json['is_done'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': title,
      'description': description,
      'is_done': isDone,
    };
  }
}
