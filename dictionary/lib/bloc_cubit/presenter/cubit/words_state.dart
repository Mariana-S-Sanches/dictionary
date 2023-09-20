import 'package:equatable/equatable.dart';
import 'package:dictionary/bloc_cubit/model/word_model.dart';

abstract class WordsState extends Equatable {}

class WordsInitialState extends WordsState {
  @override
  List<Object> get props => [];
}

class WordsLoadingState extends WordsState {
  final bool prop;

  WordsLoadingState(this.prop);

  @override
  List<Object> get props => [prop];
}
class WordsLoadState extends WordsState {
  final bool prop;

  WordsLoadState(this.prop);

  @override
  List<Object> get props => [prop];
}

class WordsSucessState extends WordsState {
  final WordsModel wordsModel;

  WordsSucessState(this.wordsModel);

  @override
  List<Object> get props => [wordsModel];
}

class WordsErrorState extends WordsState {
  final String failure;

  WordsErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
