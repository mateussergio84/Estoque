import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
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
    print("Produtos cadastrado: "+produtosRecebidos.toString());
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

  void _removerItem(Produto produto, int index) {
    setState(() {
      listaprodutos = List.from(listaprodutos)..removeAt(index);
      banco.apagarProduto(produto.id);
    });
  }

  void _atualizarProduto(Produto produto) {
    TextEditingController txtProd = TextEditingController();
    TextEditingController txtQuant = TextEditingController();
    TextEditingController txtPrec = TextEditingController();
    TextEditingController txtMini = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atualize o Produto",
          ),
          content: Container(
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: txtProd,
                      decoration: InputDecoration(labelText: 'Produto',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: txtQuant,
                      decoration: InputDecoration(labelText: 'Quantidade',
                          border: OutlineInputBorder()
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: txtPrec,
                      decoration: InputDecoration(labelText: 'Preço',
                          border: OutlineInputBorder()
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: txtMini,
                      decoration: InputDecoration(labelText: 'Quantidade Minima',
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Salvar",

              ),
              onPressed: () {
                Produto _produto;
                if (txtQuant != null && txtMini != null && txtPrec != null) {
                  _produto = Produto(txtProd.text, num.tryParse(txtQuant.text), num.tryParse(txtPrec.text), num.tryParse(txtMini.text));
                  banco.atualizarProduto(_produto, produto.id);
                  recebeProdutos();
                  Navigator.of(context).pop();
                }
              },
            ),
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('Cancelar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    banco.totalProdutos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque - Lista'),
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
                        title: Text(obj.nome),
                        subtitle: Text('Quantidade: '+obj.quantidade.toString()+"  Preço: "+obj.valor.toString()),
                        trailing:
                        Container(
                          width: 100,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.indigo,
                                  onPressed: (){
                                    _atualizarProduto(listaprodutos[index]);
                                  }),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.black,
                                  onPressed: (){
                                    _removerItem(listaprodutos[0], index);
                                  }),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
        ],

      ),
    );
  }
}
