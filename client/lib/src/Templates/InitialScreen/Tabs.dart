import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key key,
    @required this.press,
  }) : super(key: key);

  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all( color: Colors.black26, width: 1.0 ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          indicator: BoxDecoration(
            color: Color.fromRGBO(20, 33, 61, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          indicatorColor: Colors.white,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          onTap: press,
          tabs: [
            Tab(text: "Entrar"), Tab(text: "Cadastre-se")
          ],
        ),
      ),
    );
  }
}
