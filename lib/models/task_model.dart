class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final String priority;
  final String status;
  final String project;
  final bool isAiSuggested;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.project,
    this.isAiSuggested = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'priority': priority,
      'status': status,
      'project': project,
      'isAiSuggested': isAiSuggested,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      priority: json['priority'],
      status: json['status'],
      project: json['project'],
      isAiSuggested: json['isAiSuggested'] ?? false,
    );
  }
}
