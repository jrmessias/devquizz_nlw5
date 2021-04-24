import 'package:flutter/material.dart';
import 'package:quizdev/core/app_colors.dart';
import 'package:quizdev/core/app_images.dart';
import 'package:quizdev/core/app_text_styles.dart';
import 'package:quizdev/shared/widgets/custom_linear_progress_indicator/custom_linear_progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget(
      {Key? key,
      required this.title,
      required this.completed,
      required this.onTap,
      this.percent = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    completed,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CustomLinearProgressIndicator(value: percent),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
