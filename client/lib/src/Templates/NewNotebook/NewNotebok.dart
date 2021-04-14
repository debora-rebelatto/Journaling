import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/NotebooksController.dart';
import 'package:journal_app/src/Templates/Components/Validators.dart';

class NewNotebok extends StatefulWidget {
  @override
  _NewNotebokState createState() => _NewNotebokState();
}

class _NewNotebokState extends State<NewNotebok> {
  TextEditingController title = TextEditingController(text: '');
  var color;

  var allColors = [
    "EE1D6A",
    "B4B0E3",
    "2A27E4",
    "F8A8B4",
    "FFC300",
    "FF5733",
    "C70039",
    "581845",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NewNotebok'),),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [

              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Title'
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                validator: (value) => FieldValidator.validateIfEmpty(value)
              ),

              ListView.builder(
                shrinkWrap: true,
                itemCount: allColors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(allColors[index], style: TextStyle(color: Color(int.parse('0xff' + allColors[index])))),
                    leading: Radio(
                      value: allColors[index],
                      groupValue: color,
                      onChanged: (value) {
                        setState(() {
                          color = value;
                        });
                      },
                    ),
                  );
                },
              ),

              FlatButton(
                child: Text('Save'),
                onPressed: () async {
                  var res = await NotebooksController.postNotebook(title.text, color);
                  if(res.statusCode == 200) {
                    Navigator.of(context).pop();
                  } else {
                    print('error');
                  }
                },
              )
            ],
          ),
        )
      ),
    );
  }
}