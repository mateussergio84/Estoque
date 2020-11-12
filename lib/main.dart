import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        '/tela_inicial' : (context) => Tela_inicial(),
        '/menu': (context) =>
            TemplatePage(titulo: 'Estoque - Menu', conteudo: Menu()),
        '/listaProdutos': (context) =>
            TemplatePage(titulo: 'Estoque', conteudo: ListaProdutos()),
        '/secundaria': (context) =>
            TemplatePage(titulo: 'Estoque - Cadastro', conteudo: TelaSecundaria()),
      },
      initialRoute: '/tela_inicial',
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


class ListaProdutos extends StatefulWidget {
  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(

          ),
        )

    );
  }
}

class Menu extends StatefulWidget {
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add_shopping_cart),
          title: Text('Cadastrar Produto'),
          onTap: () {
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
              decoration: InputDecoration(labelText: 'Preço'),
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
