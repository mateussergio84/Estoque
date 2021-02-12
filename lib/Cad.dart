import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Lista.dart';
import 'Produto.dart';

class Cad extends StatefulWidget {
  @override
  _CadState createState() => _CadState();
}

class _CadState extends State<Cad> {
  final _formKey = GlobalKey<FormState>();
  static DatabaseHelper banco;
  @override
  void initState() {
    banco = new DatabaseHelper();
    banco.inicializaBanco();
  }

  void salvarProduto(){
    setState(()async {
      Produto produto;
      produto = new Produto(txtProduto.text, num.tryParse(txtQuantidade.text), num.tryParse(txtPreco.text),num.tryParse(txtMinimo.text));
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque - Cadastro'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Form(
        key: _formKey,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: txtProduto,
                decoration: InputDecoration(labelText: 'Produto',
                    border: OutlineInputBorder()),
                validator: (value){
                  if(value.isEmpty) return "Campo obrigatorio";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: txtQuantidade,
                decoration: InputDecoration(labelText: 'Quantidade',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.isEmpty) return "Campo obrigatorio";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: txtPreco,
                decoration: InputDecoration(labelText: 'Preço',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.isEmpty) return "Campo obrigatorio";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: txtMinimo,
                decoration: InputDecoration(labelText: 'Quantidade Minima',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.isEmpty) return "Campo obrigatorio";
                  return null;
                },
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
                if(_formKey.currentState.validate()){
                  salvarProduto();
                }
              },
            ),
          ]
      ),
      ),
    );
  }
}