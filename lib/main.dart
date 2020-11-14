import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/tela_inicial' : (context) => Tela_inicial(),
        '/tela_secundaria' : (context) => TelaSecundaria(),
      },
      initialRoute: '/tela_secundaria',
    );
  }
}


class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  final TextEditingController _controladorProduto = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorPreco = TextEditingController();
  final TextEditingController _controladorMinimo = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque - Menu'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          TextField(
            controller: _controladorProduto,
            decoration: InputDecoration(hintText: 'Produto'),
          ),
           TextField(
              controller: _controladorQuantidade,
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controladorPreco,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
          TextField(
              controller: _controladorMinimo,
              decoration: InputDecoration(labelText: 'Quantidade Minima'),
              keyboardType: TextInputType.number,
            ),
          FlatButton(
            color: Colors.blue[700],
            child: Text('Adicionar',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: (){
            },
          ),
        ]
        ),
    );
  }
}


class Tela_inicial extends StatefulWidget {
  @override
  _Tela_inicialState createState() => _Tela_inicialState();
}

class _Tela_inicialState extends State<Tela_inicial> {
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
              title: Text('Cadastrar Produto'),
              onTap:(){
                Navigator.pushNamed(context, '/secundaria');
              },
            ),
            ListTile(
              leading: Icon(Icons.format_list_bulleted_sharp),
              title: Text('Lista de Produtos'),
            ),
            ListTile(
              leading: Icon(Icons.bar_chart_sharp),
              title: Text('Controle de gastos'),
            ),
          ],
        ),
      ),
    );
  }
}
