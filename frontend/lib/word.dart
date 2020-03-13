import 'package:intl/intl.dart';


class Word {
  String _id;
  String word;
  String description;
  String quote;
  DateTime createdAt;
  DateTime updatedAt;
  Word(String s, {
    id,
    this.word,
    this.description,
    this.quote,
    this.createdAt,
    this.updatedAt
  }): this._id = id;

  get formatedCreatedDate {
    if (createdAt == null) {
      return 'N/A';
    }
    return DateFormat('dd MMM. yyyy').format(createdAt).toLowerCase();
  }

  get id => this._id;

  Word.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    word = json['word'];
    quote = json['quote'];
    description = json['description'];
    createdAt = new DateTime(json['createdAt']);
    updatedAt = new DateTime(json['updatedAt']);
  }

  Map<String, dynamic> toJson() =>
      {
        'id': _id,
        'word': word,
        'quote': quote,
        'description': description,
      };
}
