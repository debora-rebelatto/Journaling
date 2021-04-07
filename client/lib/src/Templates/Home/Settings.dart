import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Controllers/API.dart';
import '../../Controllers/PortController.dart';

class HostPorta extends StatefulWidget {
  HostPorta({ Key key }) : super(key: key);

  @override
  _HostPortaState createState() => _HostPortaState();
}

class _HostPortaState extends State<HostPorta> {
  TextEditingController host = TextEditingController(text: '');

  _getUrl() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      host.text = pref.getString("url") == null ? APIURL.url : pref.getString("url");
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
      appBar: AppBar(title: Text("Host/Porta")),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container( child: TextField( controller: host, maxLines: 1, decoration: InputDecoration( labelText: 'IP/Host') )),
            Container( child: buttonDefault( 'Usar IP/Porta Padrão', 'defaultUrlPort' )),
            Container( child: buttonDefault( 'Usar IP Externo', 'outsider' )),
            check()
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed: () async { dialogFloatingButton(); },
      )
    );
  }

  dialogFloatingButton() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Salvar as alterações?"),
        content: Text('Host: ${host.text}'),
        actions: [ accept(), cancel() ],
      )
    );
  }

  accept() {
    return FlatButton(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
      child: Text( "Sim", style: TextStyle( color: Colors.white), ),
      color: Colors.grey,
      onPressed: () {
        update(host.text);
        Navigator.of(context).pop();
      },
    );
  }

  buttonDefault(String text, String type) {
    return Container(
      padding: EdgeInsets.only( top: 10 ),
      child: FlatButton(
        color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Text(text, style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white )),
        onPressed: () { updateHostPort(type); },
      )
    );
  }

  updateHostPort(String type) {
    switch(type) {
      case'outsider': update('http://177.75.143.27:3000'); break;
      case 'defaultUrlPort': update('http://192.168.15.26:3000'); break;
    }
  }

  check() {
    return FlatButton(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
      child: Text("Check"),
      color: Colors.grey,
      onPressed: () async {
        var k = await PortController.getHostPort();
        showDialog(context: context, child: AlertDialog(content: Text(k)));
      },
    );
  }

  update(String newHost) async {
    await PortController.updateHostPort(url: newHost);
    setState(() { host.text = newHost; });
  }
}

cancel() => Builder(builder: (context) => FlatButton(
  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
  child: Text("Cancelar", style: TextStyle( color: Colors.white) ),
  color: Colors.red[700],
  onPressed: () async { Navigator.of(context).pop(); },
));
