class WordsModel {
  String? word;
  Syllables? syllables;
  List<Results>? results;
  Pronunciation? pronunciation;

  WordsModel({
    this.word,
    this.results,
    this.syllables,
    this.pronunciation,
  });

  WordsModel.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    syllables = json['syllables'] != null ? Syllables.fromJson(json['syllables']) : null;

    if (json['pronunciation'] != null) {
      pronunciation = Pronunciation.fromJson(json['pronunciation']);
    } else {
      pronunciation = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word'] = word;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (syllables != null) {
      data['syllables'] = syllables!.toJson();
    }
    if (pronunciation != null) {
      data['pronunciation'] = pronunciation!.toJson();
    }
    return data;
  }
}

class Results {
  String? definition;
  String? partOfSpeech;
  List<String>? typeOf;
  List<String>? synonyms;
  List<String>? hasTypes;
  List<String>? examples;
  List<String>? derivation;

  Results({
    this.typeOf,
    this.hasTypes,
    this.synonyms,
    this.examples,
    this.definition,
    this.derivation,
    this.partOfSpeech,
  });

  Results.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    partOfSpeech = json['partOfSpeech'];
    if (json['synonyms'] != null) {
      synonyms = json['synonyms'].cast<String>();
    } else {
      synonyms = [];
    }

    if (json['hasTypes'] != null) {
      hasTypes = json['hasTypes'].cast<String>();
    } else {
      hasTypes = [];
    }
    if (json['derivation'] != null) {
      derivation = json['derivation'].cast<String>();
    } else {
      derivation = [];
    }
    if (json['examples'] != null) {
      examples = json['examples'].cast<String>();
    } else {
      examples = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['definition'] = definition;
    data['partOfSpeech'] = partOfSpeech;
    data['synonyms'] = synonyms;
    data['typeOf'] = typeOf;
    data['hasTypes'] = hasTypes;
    data['derivation'] = derivation;
    data['examples'] = examples;
    return data;
  }
}

class Syllables {
  int? count;
  List<String>? list;

  Syllables({this.count, this.list});

  Syllables.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    list = json['list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['list'] = list;
    return data;
  }
}

class Pronunciation {
  String? all;

  Pronunciation({this.all});

  Pronunciation.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}
