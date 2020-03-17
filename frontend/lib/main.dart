import 'package:flutter/material.dart';
import 'package:lama_frontend/date-item.dart';
import 'package:lama_frontend/word-dialog.dart';
import 'package:lama_frontend/word-item.dart';
import './app-theme.dart';
import './word.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import './constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lama',
      theme: ThemeData(
        primarySwatch: AppTheme.mainMaterial,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: AfterSplash()),
      ),
    );
  }
}

class AfterSplash extends StatefulWidget {
  AfterSplash({Key key}) : super(key: key);
  @override
  _AfterSplash createState() => _AfterSplash();
}

class _AfterSplash extends State<AfterSplash> {
  List<Word> words = [];

  void fetchWords() async {
    Response rawResponse = await Dio().get("${Constants.apiServer}/words");
    var nana = rawResponse.data as List;
    List<Word> nanas = nana.map((i) => Word.fromJson(i)).toList();
    setState(() {
      words = nanas;
    });
  }

  void onSave(oldWord, newWord) async {
    print('onSave');
    if (oldWord == null) {
      await Dio().post("${Constants.apiServer}/words/", data: newWord.toJson());
    } else {
      await Dio().put("${Constants.apiServer}/words/${oldWord.id}", data: newWord.toJson());
    }
    fetchWords();
  }

  void onDelete(Word deletingWord) async {
    print('onDelete');
    await Dio().delete("${Constants.apiServer}/words/${deletingWord.id}");
    fetchWords();
  }

  void openWordDialog(context, Word word) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WordDialog(word: word, onSave: onSave, onDelete: onDelete);
        });
  }

  List<Widget> wordsToItems(List<Word> words, context) {
    List<Widget> items = [];
    var dates = groupBy(words, (obj) {
      Word word = obj as Word;
      return word.createdAt;
    });

    print(dates);

    var sortedDates = dates.keys.toList()..sort();

    print(sortedDates);

    sortedDates.asMap().forEach((index, value) {
      print(dates[index]);

      items.add(DateItem(index, value));

      dates[value].asMap().forEach((index, word) {
        items.addAll(<Widget>[
          WordItem(
            index: index,
            word: word,
            mainContext: context,
            onLongPress: openWordDialog,
          )
        ]);
      });
    });

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppTheme.logoFile,
          width: 125,
          fit: BoxFit.scaleDown,
        ),
      ),
      body: ListView(children: wordsToItems(words, context)),
      floatingActionButton: FloatingActionButton(
        key: Key('addTextButton'),
        onPressed: () => openWordDialog(context, null),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchWords();
  }
}
