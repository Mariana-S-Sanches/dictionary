import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:dictionary/bloc_cubit/model/word_model.dart';

class WordApiRequest {
  Future<WordsModel> getWords(String word) async {
    final httpClient = http.Client();
    var url = Uri.parse("https://wordsapiv1.p.rapidapi.com/words/$word");
    try {
      final response = await httpClient.get(url, headers: {
        'X-RapidAPI-Key': '22d9be5c6amshdc8daa21151daddp1e122ajsn8878dc771eff',
        'X-RapidAPI-Host': 'wordsapiv1.p.rapidapi.com',
      });

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final res = WordsModel.fromJson(jsonResponse);

        return res;
      } else {
        throw Exception(response.request);
      }
    } catch (e) {
      debugPrint("Error: $e");
      throw Exception(e);
    }
  }
}
