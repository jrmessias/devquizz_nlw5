import 'package:flutter/material.dart';
import 'package:quizdev/challenge/challenge_controller.dart';
import 'package:quizdev/challenge/widgets/next_button/next_button_widget.dart';
import 'package:quizdev/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:quizdev/challenge/widgets/quiz/quiz_widget.dart';
import 'package:quizdev/result/result_page.dart';
import 'package:quizdev/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    // challengeController.currentPageNotifier.addListener(() {
    //   setState(() {});
    // });
    pageViewController.addListener(() {
      challengeController.currentPage = pageViewController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (challengeController.currentPage < widget.questions.length) {
      pageViewController.nextPage(
        duration: Duration(milliseconds: 50),
        curve: Curves.linear,
      );
    }
  }

  void onSelected(bool value) {
    if (value == true) {
      challengeController.questionRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: ValueListenableBuilder<int>(
              valueListenable: challengeController.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                currentPage: value,
                totalPage: widget.questions.length,
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageViewController,
        children: widget.questions
            .map((question) => QuizWidget(
                  question: question,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
          child: ValueListenableBuilder<int>(
            valueListenable: challengeController.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: value < widget.questions.length,
                  child: Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: nextPage,
                    ),
                  ),
                ),
                Visibility(
                  visible: value == widget.questions.length,
                  child: SizedBox(width: 8),
                ),
                Visibility(
                  visible: value == widget.questions.length,
                  child: Expanded(
                    child: NextButtonWidget.green(
                      label: "Confirmar",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultPage(
                              title: widget.title,
                              totalQuestions: widget.questions.length,
                              totalQuestionsRight:
                                  challengeController.questionRight,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
