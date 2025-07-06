class Strategy {
  final String id;
  final String name;
  final String description;
  final bool isActive;

  Strategy({
    required this.id,
    required this.name,
    required this.description,
    this.isActive = false,
  });

  Strategy copyWith({
    String? id,
    String? name,
    String? description,
    bool? isActive,
  }) {
    return Strategy(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
    );
  }

  factory Strategy.fromJson(Map<String, dynamic> json) {
    return Strategy(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isActive': isActive,
    };
  }
}
