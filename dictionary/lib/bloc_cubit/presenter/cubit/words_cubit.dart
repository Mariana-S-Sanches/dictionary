// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:dictionary/bloc_cubit/external/get_words_datasource.dart';

import 'words_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
