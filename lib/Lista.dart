import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Produto.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  static DatabaseHelper banco;
  List<Produto> listaprodutos = List<Produto>();

  void recebeProdutos() async{
    banco = new DatabaseHelper();
    List produtosRecebidos = await banco.listarProdutos();
    //print("Produtos cadastrado: "+produtosRecebidos.toString());
    List<Produto> listatemporaria = List<Produto>();
    for(var item in produtosRecebidos){
      Produto p = Produto.fromMapObject(item);
      listatemporaria.add(p);
    }

    setState(() {
      listaprodutos = listatemporaria;
    });
    listatemporaria = null;
  }

  @override
  void initState() {
    super.initState();
    recebeProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque - Lista'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: listaprodutos.length,
                  itemBuilder: (context, index){
                    final Produto obj = listaprodutos[index];
                    return Card(
                      child: ListTile(
                        title: Text(obj.nome),
                        subtitle: Text(obj.nome),
                      ),
                    );
                  }))
        ],

      ),
    );
  }
}
