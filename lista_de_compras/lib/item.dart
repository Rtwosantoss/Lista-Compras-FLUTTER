class Item {
  String nome;
  int quantidade;
  bool comprado = false;
 Item({required this.nome, required this.quantidade});
}

List<Item> itensIniciais = [
  Item(nome: "Batata",  quantidade: 7),
  Item(nome: "Camisinha", quantidade: 10),
  Item(nome: "Oleo", quantidade: 2),
  Item(nome: "Refrigerante", quantidade: 6),
  Item(nome: "Sabão de coco", quantidade: 7),

];