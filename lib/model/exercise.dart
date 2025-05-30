class Exercise {
  final String name;
  final String description;
  final int duration;
  final String difficulty;

  Exercise({
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      difficulty: json['difficulty'],
    );
  }
}
