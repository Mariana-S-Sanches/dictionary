import 'package:flutter/material.dart';
import '../bloc_cubit/presenter/word_search.dart';
import '../utils/components/navigator.dart';
import '../word_load/word_load.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dictionary/utils/text_styles.dart';
import 'package:dictionary/utils/default_colors.dart';
import '../bloc_cubit/presenter/cubit/words_cubit.dart';
import '../bloc_cubit/presenter/cubit/words_state.dart';
import 'package:dictionary/bloc_cubit/model/word_model.dart';
import 'package:dictionary/utils/components/form_field.dart';
import 'package:dictionary/bloc_cubit/model/word_presset.dart';

class WordItemWidget extends StatefulWidget {
  const WordItemWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordItemWidgetState createState() => _WordItemWidgetState();
}

class _WordItemWidgetState extends State<WordItemWidget> {
  @override
  void initState() {
    WordLoad().readJsonData_A(context);
    WordLoad().readJsonData_B(context);

    WordLoad().readJsonData_OTHER(context).then((value) => hasData = value);

    super.initState();
  }

  bool? hasData;
  TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WordsMethodsCubit, WordsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFields(
                    labelText: 'Procurar palavras',
                    controller: controllerSearch,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      context.read<WordsMethodsCubit>().doGetWordMethods(controllerSearch.text);
                    },
                    child: const Icon(
                      Icons.search,
                      color: DefaultColors.neutral,
                    ),
                  ),
                )
              ],
            ),
            if (state is WordsSucessState) component(state.wordsModel),
            Row(
              children: [
                Text(
                  'A',
                  style: CustomTextStyles.headH1,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: WordLetterModel.presset_a.length,
              itemBuilder: (context, index) {
                return component(WordLetterModel.presset_a[index]);
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: WordLetterModel.presset_b.length,
              itemBuilder: (context, index) {
                return component(WordLetterModel.presset_b[index]);
              },
            ),
          ],
        );
      },
    );
  }

  component(WordsModel word) {
    return GestureDetector(
      onTap: () {
        functionNavigate(word);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: DefaultColors.background,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    word.word!,
                    style: CustomTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: DefaultColors.neutral,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  functionNavigate(WordsModel item) {
    Navigator.push(
      context,
      RouteNavigator(page: WordSearch(wordsModel: item)),
    );
  }
}
