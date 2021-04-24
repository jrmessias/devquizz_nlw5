import 'package:flutter/material.dart';
import 'package:quizdev/challenge/widgets/next_button/next_button_widget.dart';
import 'package:quizdev/core/app_images.dart';
import 'package:quizdev/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int totalQuestions;
  final int totalQuestionsRight;

  const ResultPage({
    Key? key,
    required this.title,
    required this.totalQuestions,
    required this.totalQuestionsRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.trophy),
              SizedBox(height: 30),
              Text(
                "Parabéns!",
                style: AppTextStyles.heading40,
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: "Você concluiu",
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(
                      text: "\n$title",
                      style: AppTextStyles.bodyBold,
                    ),
                    TextSpan(
                      text:
                          "\ncom ${totalQuestionsRight.toString()} de ${totalQuestions.toString()} acertos.",
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                "NLW#5 Quizz >> Confere aí, respondi o quizz $title e acertei $totalQuestionsRight perguntas.");
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.transparent(
                      label: "Voltar ao início",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
