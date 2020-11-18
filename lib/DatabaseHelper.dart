import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Produto.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;
  String tabelaProduto = 'tabela_produto';
  String colId = 'id';
  String colNome = 'nome';
  String colQuantidade = 'quantidade';
  String colValor = 'valor';
  String colMinimo = 'minimo';

  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await inicializaBanco();
    }

    return _database;
  }
  Future<Database> inicializaBanco() async {
    Directory diretorio = await getApplicationDocumentsDirectory();
    String path = diretorio.path + 'produtos.db';

    var bandoDeContatos = await openDatabase
      (path, version: 1,  onCreate: _criaBanco);
    return bandoDeContatos;
  }
  void _criaBanco(Database db, int versao) async {
    await db.execute('CREATE TABLE $tabelaProduto('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colNome TEXT,'
        '$colQuantidade Text,'
        '$colValor Text,'
        '$colMinimo Text);');
  }


  Future<int> inserirProduto(Produto produto) async {
    Database db = await this.database;
    var result = await db.insert(tabelaProduto, produto.toMap());
    return result;
  }
  Future<int> atualizarProduto(Produto produto,int id) async {
    var db = await this.database;
    var result = await db.rawUpdate("UPDATE $tabelaProduto SET $colNome = '${produto.nome}', $colQuantidade = '${produto.quantidade}', $colValor = '${produto.valor}' WHERE $colId = '$id'");
    return result;
  }
  Future<int> apagarProduto(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $tabelaProduto WHERE $colId = $id');
    return result;
  }


  Future<List<Map<String, dynamic>>> getProdutoMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery("SELECT * FROM $tabelaProduto");
    return result;
  }

  Future<List<Produto>> getListaDePoduto() async {
    var produtoMapList = await getProdutoMapList();
    int count = produtoMapList.length;
    List<Produto> listaDeProdutos = List<Produto>();
    for (int i = 0; i < count; i++) {
      listaDeProdutos.add(Produto.fromMapObject(produtoMapList[i]));
      var resultado = listaDeProdutos.toList();
    }
    return listaDeProdutos;
  }

  listarProdutos() async{
    Database db = await this.database;
    String sql = "SELECT * FROM $tabelaProduto";
    List listaProduto = await db.rawQuery(sql);
    return listaProduto;
  }

}

