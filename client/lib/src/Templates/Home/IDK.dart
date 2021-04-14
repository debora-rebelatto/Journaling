import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StuffIdk extends StatelessWidget{
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Notebooks', style: GoogleFonts.openSans(
            textStyle: TextStyle(color: Color(0xff534d6c), fontSize: 30, fontWeight: FontWeight.bold))
          )
        ),

        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 30),
          child: IconButton(
            icon: Icon(Icons.more_horiz, color: Color(0xffc8c9de), size: 40,),
            onPressed: () {
                  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: Wrap(children: <Widget>[
          ListTile(
            leading: new Icon(Icons.music_note),
            title: new Text('Músicas'),
            onTap: () => {}          
          ),
          ListTile(
            leading: new Icon(Icons.videocam),
            title: new Text('Videos'),
            onTap: () => { },          
          ),
	ListTile(
	leading: new Icon(Icons.satellite),
	title: new Text('Tempo'),
	onTap: () => {}, 
	),
         ],
        ),
       );
      }
    );

            },
          )

        ),
      ],
    );
  }
}
