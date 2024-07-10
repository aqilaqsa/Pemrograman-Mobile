import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary(this.summaryData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Text(
          'Q: ${data['question']} \nA: ${data['user_answer']}',
          style: const TextStyle(color: Colors.white),
        );
      }).toList(),
    );
  }
}
