import 'package:flutter/foundation.dart';

class Exam {
  final String id;
  final String exam_title;
  final DateTime exam_date;

  Exam({
    required this.id,
    required this.exam_title,
    required this.exam_date,
  });
}