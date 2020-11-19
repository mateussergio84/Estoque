
class Produto{
  int id;
  String nome;
  num quantidade;
  num valor;
  num minimo;

  Produto(this.nome, this.quantidade, this.valor, this.minimo);

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(id != null){
      map['id'] = id;
    }
    map['nome'] = nome;
    map['quantidade'] = quantidade;
    map['valor'] = valor;
    map['minimo'] = minimo;
    return map;
  }

  Produto.fromMapObject(Map<String, dynamic> map) {
    this.id = map ['id'];
    this.nome = map['nome'];
    this.quantidade = map[quantidade];
    this.valor = map[valor];
    this.minimo = map[minimo];
  }

}
