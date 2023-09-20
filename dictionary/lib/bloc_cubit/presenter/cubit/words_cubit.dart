// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'words_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dictionary/word_load/word_load.dart';
import 'package:dictionary/bloc_cubit/external/get_words_datasource.dart';

class WordsMethodsCubit extends Cubit<WordsState> {
  final WordApiRequest doGetWordsUseCase;

  WordsMethodsCubit({
    required this.doGetWordsUseCase,
  }) : super(WordsInitialState());

  void doGetWordMethods(String word) async {
    emit(WordsLoadingState(true));

    var result = await doGetWordsUseCase.getWords(word);

    emit(WordsSucessState(result));
  }

  void doLoadWord(context) async {
    emit(WordsLoadingState(true));

    await WordLoad().readJsonData_A(context);
    await WordLoad().readJsonData_B(context);
    await WordLoad().readJsonData_OTHER(context);

    
    emit(WordsLoadState(true));
  }
}
