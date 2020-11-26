import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Lista.dart';
import 'Produto.dart';

class Cad extends StatefulWidget {
  @override
  _CadState createState() => _CadState();
}

class _CadState extends State<Cad> {
  static DatabaseHelper banco;
  @override
  void initState() {
    banco = new DatabaseHelper();
    banco.inicializaBanco();
  }

  void salvarProduto(){
    setState(()async {
      Produto produto;
      produto = new Produto(txtProduto.text, num.tryParse(txtQuantidade.text),num.tryParse(txtMinimo.text), num.tryParse(txtPreco.text));
      //banco.inserirProduto(produto);
      int resultado = await banco.inserirProduto(produto);
      if(resultado != null ){
        print("Cadastrado com sucesso "+resultado.toString());
        txtProduto.clear();
        txtQuantidade.clear();
        txtPreco.clear();
        txtMinimo.clear();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lista()),
        );
      }
      else{
        print("erro "+resultado.toString());
      }
    });
  }


  TextEditingController txtProduto = TextEditingController();
  TextEditingController txtQuantidade = TextEditingController();
  TextEditingController txtPreco = TextEditingController();
  TextEditingController txtMinimo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //GlobalKey<FormState> _key = new GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque - Cadastro'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: txtProduto,
                decoration: InputDecoration(labelText: 'Produto',
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: txtQuantidade,
                decoration: InputDecoration(labelText: 'Quantidade',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: txtPreco,
                decoration: InputDecoration(labelText: 'Preço',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: txtMinimo,
                decoration: InputDecoration(labelText: 'Quantidade Minima',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            ),
            FlatButton(
              color: Colors.indigo,

              child: Text('Adicionar',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: (){
                salvarProduto();

                // if(_key.currentState.validate()){
                //}
              },
            ),
          ]
      ),
    );
  }
}