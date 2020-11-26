import 'package:flutter/material.dart';
import 'package:flutter_2/Falta.dart';
import 'Cad.dart';
import 'Lista.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Estoque - Menu'),
          backgroundColor: Colors.indigo,
        ),
        body:
        ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text('Cadastro de Produtos'),
              onTap:(){
                //Navigator.pushNamed(context, '/cad');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cad()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.format_list_bulleted_sharp),
              title: Text('Lista de Produtos'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Lista()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in_outlined),
              title: Text('Produtos em falta'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Falta()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


