import 'package:flutter/material.dart';
import 'package:quizdev/challenge/widgets/answer/answer_widget.dart';
import 'package:quizdev/core/app_text_styles.dart';
import 'package:quizdev/shared/models/answer_model.dart';
import 'package:quizdev/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            // {
            AnswerWidget(
              answer: answer(i),
              isSelected: i == indexSelected,
              disabled: indexSelected != -1,
              onTap: (isRight) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(milliseconds: 750))
                    .then((value) => widget.onSelected(isRight));
              },
            ),
          // }
          // ...widget.question.answers
          //     .map(
          //       (AnswerModel answer) => AnswerWidget(
          //         isRight: answer.isRight,
          //         // isSelected: false,
          //         title: answer.title,
          //       ),
          //     )
          //     .toList(),
        ],
      ),
    );
  }
}
