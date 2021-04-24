import 'package:flutter/material.dart';
import 'package:quizdev/core/core.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double value;

  const CustomLinearProgressIndicator({Key? key, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
