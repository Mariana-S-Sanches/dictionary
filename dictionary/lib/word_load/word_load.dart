// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dictionary/bloc_cubit/model/word_presset.dart';

class WordLoad {
  Future<void> readJsonData_A(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/a.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_A.fromJson(jsonResult);
  }

  Future<void> readJsonData_B(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/b.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_B.fromJson(jsonResult);
  }

  Future<void> readJsonData_C(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/c.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_C.fromJson(jsonResult);
  }

  Future<void> readJsonData_D(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/d.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_D.fromJson(jsonResult);
  }

  Future<void> readJsonData_E(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/e.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_E.fromJson(jsonResult);
  }

  Future<void> readJsonData_F(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/f.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_F.fromJson(jsonResult);
  }

  Future<void> readJsonData_G(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/g.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_G.fromJson(jsonResult);
  }

  Future<void> readJsonData_H(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/h.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_H.fromJson(jsonResult);
  }

  Future<void> readJsonData_I(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/i.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_I.fromJson(jsonResult);
  }

  Future<void> readJsonData_J(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/j.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_J.fromJson(jsonResult);
  }

  Future<void> readJsonData_K(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/k.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_K.fromJson(jsonResult);
  }

  Future<void> readJsonData_L(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/l.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_L.fromJson(jsonResult);
  }

  Future<void> readJsonData_M(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/m.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_M.fromJson(jsonResult);
  }

  Future<void> readJsonData_N(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/n.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_N.fromJson(jsonResult);
  }

  Future<void> readJsonData_O(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/o.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_O.fromJson(jsonResult);
  }

  Future<void> readJsonData_P(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/p.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_P.fromJson(jsonResult);
  }

  Future<void> readJsonData_Q(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/q.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_Q.fromJson(jsonResult);
  }

  Future<void> readJsonData_R(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/r.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_R.fromJson(jsonResult);
  }

  Future<void> readJsonData_S(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/s.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_S.fromJson(jsonResult);
  }

  Future<void> readJsonData_T(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/t.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_T.fromJson(jsonResult);
  }

  Future<void> readJsonData_U(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/u.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_U.fromJson(jsonResult);
  }

  Future<void> readJsonData_V(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/v.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_V.fromJson(jsonResult);
  }

  Future<void> readJsonData_W(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/w.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_W.fromJson(jsonResult);
  }

  Future<void> readJsonData_X(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/x.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_X.fromJson(jsonResult);
  }

  Future<void> readJsonData_Y(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/y.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_Y.fromJson(jsonResult);
  }

  Future<void> readJsonData_Z(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/z.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_Z.fromJson(jsonResult);
  }

  Future<bool> readJsonData_OTHER(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("words_json/1.json");
    final jsonResult = jsonDecode(data);
    WordByLetter_Other.fromJson(jsonResult);

    return true;
  }
}
