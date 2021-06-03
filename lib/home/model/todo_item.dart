class TodoItem {
  final int id;
  final String content;
  final bool checked;

  TodoItem({this.id, this.content, this.checked});

  factory TodoItem.fromJson(Map<String, dynamic> json) => TodoItem(
    id: json["id"],
    content: json["content"],
    checked: json["checked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "checked": checked,
  };
}