import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              Transform.translate(
                offset: Offset(0, -30),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: data['user_answer'] == data['correct_answer']
                        ? Colors.greenAccent
                        : Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data['user_answer'] as String,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.purple,
                        //fontSize: 18,
                      ),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.greenAccent,
                        //fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
