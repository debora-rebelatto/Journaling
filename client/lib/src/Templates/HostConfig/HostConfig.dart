import 'package:flutter/material.dart';
import 'package:journal_app/src/API.dart';
import 'package:journal_app/src/Controllers/PortController.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HostPorta extends StatefulWidget {
  HostPorta({ Key key }) : super(key: key);

  @override
  _HostPortaState createState() => _HostPortaState();
}

class _HostPortaState extends State<HostPorta> {
  TextEditingController host = TextEditingController(text: '');

  dynamic _getUrl() async {
    var pref = await SharedPreferences.getInstance();

    setState(() {
      host.text = pref.getString('url') ?? APIURL.url;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Host/Porta')),
      body: Container(
        constraints: BoxConstraints(maxWidth: 800),
        padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container( child: TextField( controller: host, maxLines: 1, decoration: InputDecoration( labelText: 'IP/Host') )),

            SizedBox( height: 20 ),

            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xff14213d),
              child: Text('Salvar',
                style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white )
              ),
              onPressed: () { updateHostPort(); },
            ),

            SizedBox( height: 10 ),
          ],
        )
      )
    );
  }

  dynamic accept() {
    return FlatButton(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
      child: Text( 'Sim', style: TextStyle( color: Colors.white), ),
      color: Colors.grey,
      onPressed: () {
        update(host.text);
        Navigator.of(context).pop();
      },
    );
  }

  dynamic updateHostPort() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Salvar as alterações?'),
          content: Text('Host: ${host.text}'),
          actions: [
            accept(),
            FlatButton(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
              child: Text('Cancelar', style: TextStyle( color: Colors.white) ),
              color: Colors.red[700],
              onPressed: () async { Navigator.of(context).pop(); },
            )
          ],
        );
      },
    );
  }

  dynamic update(String newHost) async {
    await PortController.updateHostPort(url: newHost);
    setState(() {
      host.text = newHost;
    });
  }
}
