class Project {
  final String id;
  final String title;
  final int totalTasks;
  final int completedTasks;

  Project({
    required this.id,
    required this.title,
    required this.totalTasks,
    required this.completedTasks,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'totalTasks': totalTasks,
      'completedTasks': completedTasks,
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      totalTasks: json['totalTasks'],
      completedTasks: json['completedTasks'],
    );
  }
}
