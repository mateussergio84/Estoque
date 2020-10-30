import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(HomePage());
}

Widget barraSuperior(
    {@required String titulo, double height = 100.0}) {
  return Container(
    padding: EdgeInsets.all(35.0),
      color: Colors.blue[700],
      height: height,
      child: Center(
        child: Row(
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ));
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
        '/inicial': (context) =>
            TemplatePage(titulo: 'Estoque', conteudo: TelaInicial()),
        '/secundaria': (context) => 
            TemplatePage(titulo: 'Estoque - Cadastro', conteudo: TelaSecundaria() ),
      },
      initialRoute: '/secundaria',
    );
  }
}

class TemplatePage extends StatelessWidget {
  final String titulo;
  final Widget conteudo;
  final double height;


  TemplatePage(
      {this.titulo, this.conteudo, this.height = 100.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        barraSuperior(titulo: titulo, height: height),
        conteudo
      ],
    ));
  }
}

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Text('teste');
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
    return Column(
      children: <Widget>[
        TextField(
          controller: _controladorProduto,
          decoration: InputDecoration(labelText: 'Produto'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextField(
            controller: _controladorQuantidade,
            decoration: InputDecoration(labelText: 'Quantidade'),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextField(
            controller: _controladorPreco,
            decoration: InputDecoration(labelText: 'Preco'),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextField(
            controller: _controladorMinimo,
            decoration: InputDecoration(labelText: 'Quantidade Minima'),
            keyboardType: TextInputType.number,
          ),
        ),
        RaisedButton(
          child: Text('Adicionar'),
          onPressed: (){},
        )
      ],
    );
  }
}

