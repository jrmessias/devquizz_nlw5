import 'package:flutter/material.dart';
import 'package:quizdev/challenge/challenge_page.dart';
import 'package:quizdev/home/home_controller.dart';
import 'package:quizdev/home/home_state.dart';
import 'package:quizdev/home/widgets/app_bar/app_bar_widget.dart';
import 'package:quizdev/home/widgets/level_button/level_button_widget.dart';
import 'package:quizdev/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();

    homeController.getUser().then((value) => homeController.getQuizzes());
    homeController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (homeController.state == HomeState.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBarWidget(
        user: homeController.user!,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: homeController.quizzes!
                    .map(
                      (e) => QuizCardWidget(
                        title: e.title,
                        completed:
                            "${e.questionAnswered}/${e.questions.length}",
                        percent: e.questionAnswered / e.questions.length,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChallengePage(
                                questions: e.questions,
                                title: e.title,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
