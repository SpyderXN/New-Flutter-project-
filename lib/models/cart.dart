import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel catalog;

//Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  //Get items in the cart
  Iterable<Item> get items =>
      _itemIds.map((id) => catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
