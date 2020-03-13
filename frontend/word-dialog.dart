// import 'package:flutter/material.dart';

// class WordDialog extends Container {
//   String title;
//   WordDialog({Key key, this.title}) {
//     super(
//       // key: key,
//       child: AlertDialog(
//         title: new Text(title)
//       )
//     );
//   }
// }

// builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: new Text('New word'),
//               content: Form(
//                 key: _newWordFormKey,
//                 child: Container(
//                   height: 200,
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Word'
//                         ),
//                         validator: (value) {
//                           return value.isEmpty ? 'required' : null;
//                         },
//                         onChanged: (value) {
//                           if (value.isEmpty) {
//                             setState(() {
//                               isFormValid = false;
//                             });
//                           } else {
//                             setState(() {
//                               isFormValid = true;
//                             });
//                           }
//                         },
//                         onSaved: (value) {
//                           data.word = value;
//                         }
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Definition'
//                         ),
//                         onSaved: (value) {
//                           data.definition = value;
//                         }
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Quote'
//                         ),
//                         onSaved: (value) {
//                           data.quote = value;
//                         }
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               actions: <Widget>[
//                 new FlatButton(
//                   child: new Text('CLOSE'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 new FlatButton(
//                   child: new Text('SAVE'),
//                   onPressed: isFormValid ? () => _onSave(context) : null,
//                 )
//               ],
//             );
//           }
//         );
//       }