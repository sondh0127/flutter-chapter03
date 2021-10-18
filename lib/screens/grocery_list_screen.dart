import 'package:chapter03/components/grocery_tile.dart';
import 'package:chapter03/models/grocery_manager.dart';
import 'package:chapter03/screens/grocery_item_screen.dart';
import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;

    return ListView.separated(
      itemCount: groceryItems.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 16.0,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        final item = groceryItems[index];
        return Dismissible(
          key: Key(item.id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(Icons.delete_forever,
                color: Colors.white, size: 50.0),
          ),
          onDismissed: (direction) {
            manager.deleteItem(index);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.name} dismissed')));
          },
          child: InkWell(
            child: GroceryTile(
              item: item,
              onComplete: (change) {
                if (change != null) {
                  manager.completeItem(index, change);
                }
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                    originalItem: item,
                    onUpdate: (item) {
                      manager.updateItem(item, index);
                      Navigator.pop(context);
                    },
                    onCreate: (item) {},
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
