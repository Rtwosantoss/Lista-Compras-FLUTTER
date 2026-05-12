import 'package:flutter/material.dart';
import 'item.dart';

class ListaDeCompras extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaDeCompras();
  }
}

class _ListaDeCompras extends State<ListaDeCompras> {
  List<Item> _itens = itensIniciais;

  var _itemController = TextEditingController();
  var _qtdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Compras"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 240,
                  child: TextField(
                    controller: _itemController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Item",
                    ),
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _qtdController,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: false,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Qtd",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 250,
            child: FilledButton(onPressed: () {
              if (_itemController.text.isEmpty || _qtdController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Preencha todos os campos"),)
                  );
              } else {
                var novoItem = Item(nome: _itemController.text, quantidade: int.tryParse(_qtdController.text) ?? 1);
                setState(() {
                  _itens.add(novoItem);
                });

                _qtdController.text = "";
                _itemController.text = "";

              }
            
            }, child: Text("Adicionar")),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _itens.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  _itens[index].comprado
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                ),
                title: Text(_itens[index].nome),
                subtitle: Text("Quantidade: ${_itens[index].quantidade}"),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _itens.remove(index);
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
                onTap: () {
                  setState(() {
                    _itens[index].comprado = !_itens[index].comprado;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
