import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/src/Controllers/NotebooksController.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'Components/Validators.dart';

class Create extends StatefulWidget {
  CreateState createState() => CreateState();
}

class CreateState extends State<Create> {
  TextEditingController _title = TextEditingController(text: '');
  Color currentColor = Colors.limeAccent;
  changeColor(Color color) => setState(() => currentColor = color);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children:[
        NestedScrollView(
          headerSliverBuilder: (context, index) {
            return <Widget> [
              SliverAppBar(
                pinned: false,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Color(0xff373348),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
                ),
                title: Text('title', style: GoogleFonts.openSans(
                  textStyle: TextStyle(color: Color(0xff373348), fontSize: 20))
                ),
                backgroundColor: Colors.transparent,
                centerTitle: true,
                automaticallyImplyLeading: false,
                floating: true,

                )
            ];
          },
          body: Container(
            child: Column(children: [

              Container(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _title,
                  decoration: InputDecoration( hintText: 'Título'),
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  validator: (value) => FieldValidator.validateIfEmpty(value)
                ),
              ),

              ColorPicker(
                pickerColor: currentColor,
                onColorChanged: changeColor,
                colorPickerWidth: 300.0,
                pickerAreaHeightPercent: 0.7,
                enableAlpha: true,
                displayThumbColor: true,
                showLabel: true,
                paletteType: PaletteType.hsl,
                pickerAreaBorderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(2.0),
                  topRight: const Radius.circular(2.0),
                ),
              ),
              FlatButton(
                child: Text("ok"),
                onPressed: () async { await NotebooksController.postNotebook('name', "EE1D6A"); },
              )
            ],)
          ),
        )
      ]),
    );
  }
}
