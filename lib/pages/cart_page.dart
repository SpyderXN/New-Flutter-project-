import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(Theme.of(context).colorScheme.secondary)
                  .make();
            },
            mutations: const {RemoveMutation},
            notifications: {},
          ),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet".text.make()));
            },
            child: "Buy".text.white.make(),
          ).w24(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                      onPressed: () => RemoveMutation(item: _cart.items[index]),
                      icon: const Icon(Icons.remove)),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
