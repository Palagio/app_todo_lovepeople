import 'dart:convert';
import 'package:flutter/material.dart';

class NewTaskModel {
  final String title;
  final String description;
  final Color color;
  NewTaskModel({
    required this.title,
    required this.description,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'color': color,
    };
  }

  factory NewTaskModel.fromMap(Map<String, dynamic> map) {
    return NewTaskModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewTaskModel.fromJson(String source) =>
      NewTaskModel.fromMap(json.decode(source));
}
