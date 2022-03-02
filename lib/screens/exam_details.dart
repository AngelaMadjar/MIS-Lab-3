import 'package:flutter/material.dart';
import 'package:mis_lab3_181010/models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  static const routeName = '/exam_detail';

  //final ExamItem item;
  //ExamDetailScreen(this.item);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Exam;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.exam_title),
      ),
      body: Column(children: [
        Text(item.exam_title),
        Text(item.exam_date.toString()),
        Text(item.id),
      ]),
    );
  }
}