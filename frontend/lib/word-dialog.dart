import 'package:flutter/material.dart';
import 'package:lama_frontend/app-theme.dart';
import 'package:lama_frontend/word.dart';

class WordDialog extends StatefulWidget {
  final Word word;
  final dynamic onSave;
  final dynamic onDelete;
  WordDialog({this.word, this.onSave, this.onDelete});

  @override
  _WordDialog createState() =>
      _WordDialog(word: word, onSave: onSave, onDelete: onDelete);
}

class _WordDialog extends State<WordDialog> {
  Word word;
  dynamic onSave;
  dynamic onDelete;
  TextEditingController wordCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController quoteCtrl = TextEditingController();
  bool isFormValid = false;
  bool loading = false;
  Word formData = Word("toto");

  final form = GlobalKey<FormState>();
  _WordDialog({this.word, this.onSave, this.onDelete});

  void validateForm() {
    bool isValid = wordCtrl.text.isNotEmpty;
    if (isFormValid != isValid) {
      setState(() {
        isFormValid = wordCtrl.text.isNotEmpty;
      });
    }
  }

  void swap1() {
    String temp1 = wordCtrl.text;
    String temp2 = descriptionCtrl.text;
    if (temp2.isEmpty) {
      wordCtrl.clear();
    } else {
      wordCtrl.text = temp2;
    }

    if (temp1.isEmpty) {
      descriptionCtrl.clear();
    } else {
      descriptionCtrl.text = temp1;
    }
    validateForm();
  }

  void swap2() {
    String temp1 = descriptionCtrl.text;
    String temp2 = quoteCtrl.text;
    if (temp2.isEmpty) {
      descriptionCtrl.clear();
    } else {
      descriptionCtrl.text = temp2;
    }

    if (temp1.isEmpty) {
      quoteCtrl.clear();
    } else {
      quoteCtrl.text = temp1;
    }
  }

  @override
  void initState() {
    super.initState();
    if (word != null)
      wordCtrl.text = word.word;
    else
      wordCtrl.clear();
    if (word != null && word.description != null)
      descriptionCtrl.text = word.description;
    else
      descriptionCtrl.clear();
    if (word != null && word.quote != null)
      quoteCtrl.text = word.quote;
    else
      quoteCtrl.clear();
    validateForm();
  }

  @override
  Widget build(BuildContext build) {
    String title = word == null ? 'New word' : 'Edit my word';
    return AlertDialog(
      title: new Text(
        title,
        key: Key('addNewWordDialogTitle'),
      ),
      key: Key('addNewWordDialog'),
      content: Form(
        key: form,
        child: Container(
          height: word == null ? 200 : 300,
          child: Column(
            children: <Widget>[
              TextFormField(
                key: Key('newWordInput'),
                decoration: InputDecoration(hintText: 'Word'),
                validator: (value) {
                  return value.isEmpty ? 'required' : null;
                },
                onChanged: (value) {
                  validateForm();
                },
                onSaved: (value) {
                  formData.word = value;
                },
                controller: wordCtrl,
              ),
              Container(
                child: word == null
                    ? null
                    : IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.swap_vert),
                        onPressed: () {
                          swap1();
                        },
                      ),
              ),
              TextFormField(
                  key: Key('newDefinitionInput'),
                  decoration: InputDecoration(hintText: 'Definition'),
                  onSaved: (value) {
                    formData.description = value;
                  },
                  controller: descriptionCtrl),
              Container(
                  child: word == null
                      ? null
                      : IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(Icons.swap_vert),
                          onPressed: () {
                            swap2();
                          },
                        )),
              TextFormField(
                  key: Key('newQuoteInput'),
                  decoration: InputDecoration(hintText: 'Quote'),
                  onSaved: (value) {
                    formData.quote = value;
                  },
                  controller: quoteCtrl),
              // CircularProgressIndicator()
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: 50,
                      child: word == null
                          ? Container()
                          : FlatButton(
                              padding: EdgeInsets.all(0),
                              child: Text('DELETE',
                                  style: TextStyle(color: Colors.red)),
                              onPressed: () async {
                                await onDelete(word);
                                Navigator.of(context).pop();
                              })),
                  Container(
                      width: 50,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text('CLOSE',
                            style: TextStyle(color: AppTheme.mainColor)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )),
                  Container(
                      width: 50,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'SAVE',
                          key: Key('saveButton'),
                          style: TextStyle(
                              color: isFormValid
                                  ? AppTheme.mainColor
                                  : Colors.grey),
                        ),
                        onPressed: isFormValid
                            ? () async {
                                if (form.currentState.validate()) {
                                  form.currentState.save();
                                  Word newWord = new Word("2");
                                  newWord.word = formData.word;
                                  newWord.description = formData.description;
                                  newWord.quote = formData.quote;
                                  newWord.createdAt = DateTime.now();
                                  onSave(word, newWord);
                                  Navigator.of(context).pop();
                                }
                              }
                            : null,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
