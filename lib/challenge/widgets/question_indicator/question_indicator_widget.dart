import 'package:flutter/material.dart';
import 'package:quizdev/core/app_text_styles.dart';
import 'package:quizdev/shared/widgets/custom_linear_progress_indicator/custom_linear_progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.totalPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "de $totalPage",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          CustomLinearProgressIndicator(value: currentPage / totalPage)
        ],
      ),
    );
  }
}
