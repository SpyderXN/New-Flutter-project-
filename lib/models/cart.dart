import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field
  late CatalogModel catalog;

//Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation({required this.item});

  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.add(item.id);
  }
}
