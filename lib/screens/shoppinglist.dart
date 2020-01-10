import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<Widget> items = new List();

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(child: items[index]);
      },
    );
  }

  Widget fetchItem(int index) {
    //TODO: Connect with firebase later
    return Card(
      child: ListTile(
        title: Text('Item $index'),
        trailing: Icon(Icons.remove),
        onTap: () {
          setState(() {
            items.removeAt(index);
          });
        },
      ),
    );
  }

  void fetchItems() {
    for (int i = 0; i < 20; i++) {
      this.items.add(fetchItem((i)));
    }
  }
}
