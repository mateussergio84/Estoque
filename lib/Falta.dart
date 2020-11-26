import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'DatabaseHelper.dart';
import 'Produto.dart';

class Falta extends StatefulWidget {
  @override
  _FaltaState createState() => _FaltaState();
}

class _FaltaState extends State<Falta> {

  static DatabaseHelper banco;
  List<Produto> listaprodutos = List<Produto>();

  void recebeProdutos() async{
    banco = new DatabaseHelper();
    List produtosRecebidos = await banco.Produtosfalta();
    print("Produtos em falta: "+produtosRecebidos.toString());
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
        title: Text('Estoque - Produto em Falta'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child:
              ListView.builder(
                  itemCount: listaprodutos.length,
                  itemBuilder: (context, index){
                    final Produto obj = listaprodutos[index];
                    return Card(
                      child: ListTile(
                        title: Center(child: Text(obj.nome),),
                        subtitle: Center(child: Text('Quantidade em estoque: '+obj.quantidade.toString()+"  Minimo desejado: "+obj.valor.toString()) ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}



