import 'package:flutter/cupertino.dart';
import 'package:quizdev/home/home_repository.dart';
import 'package:quizdev/home/home_state.dart';
import 'package:quizdev/shared/models/quiz_model.dart';
import 'package:quizdev/shared/models/user_model.dart';

class HomeController {
  // HomeState state = HomeState.empty;
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;

  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final homeRepository = HomeRepository();

  Future<void> getUser() async {
    state = HomeState.loading;

    user = await homeRepository.getUser();

    // state = HomeState.success;
  }

  Future<void> getQuizzes() async {
    // state = HomeState.loading;

    quizzes = await homeRepository.getQuizzes();

    state = HomeState.success;
  }
}
