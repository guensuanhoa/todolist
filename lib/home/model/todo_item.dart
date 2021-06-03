class TodoItem {
  final int id;
  final String content;

  TodoItem({this.id, this.content});

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
    id: json["id"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
  };
}