import 'package:flutter/cupertino.dart';

class Move {

  const Move({
    required this.name,
    this.description = '',
    this.steps = const <String>[],
    this.imagePath,
  });

  factory Move.fromMap(Map<String, dynamic> data,) {
    final List stepsData = data['steps'];
    return Move(
      name: data['name'],
      description: data['description'],
      steps: stepsData.whereType<String>().toList(),
      imagePath: data['imagePath'],
    );
  }

  Map<String, dynamic> get asMap => {
    'name': name,
    'description': description,
    'steps': steps,
    'imagePath': imagePath,
  };

  final String name;
  final String description;
  final List<String> steps;
  final String? imagePath;

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) {
    if (other is! Move) return false;
    return name == other.name && description == other.description;
  }

  @override
  int get hashCode => hashValues(name, description,);
}