import 'package:flutter/material.dart';
import 'package:quizdev/core/app_colors.dart';
import 'package:quizdev/core/app_text_styles.dart';

class ChartWidget extends StatefulWidget {
  final double score;

  const ChartWidget({Key? key, required this.score}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void _initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: widget.score)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animation.value / 100,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              child: Text(
                "${_animation.value.toInt()}%",
                style: AppTextStyles.heading,
              ),
            )
          ],
        ),
      ),
    );
  }
}