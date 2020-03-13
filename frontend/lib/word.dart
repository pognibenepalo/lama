import 'package:intl/intl.dart';


class Word {
  String _id;
  String word;
  String description;
  String quote;
  String createdAt;
  String updatedAt;
  Word(String s, {
    id,
    this.word,
    this.description,
    this.quote,
    this.createdAt,
    this.updatedAt
  }): this._id = id;

  String formateDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd MMM. yyyy').format(dateTime).toLowerCase();
  }

  get id => this._id;

  Word.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    word = json['word'];
    quote = json['quote'];
    description = json['description'];
    createdAt = formateDate(json['createdAt']);
    updatedAt = formateDate(json['updatedAt']);
  }

  Map<String, dynamic> toJson() =>
      {
        'id': _id,
        'word': word,
        'quote': quote,
        'description': description,
      };
}
