import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
              child: "Add".text.xl.white.make(),
            ).wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                width: context.screenWidth,
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(Theme.of(context).colorScheme.secondary)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Lorem at magna sadipscing invidunt lorem, eirmod lorem et et sea duo sit ut est. Dolore lorem magna est takimata, stet aliquyam est et amet ipsum no et sit. Ipsum eos erat dolor takimata elitr est, sit takimata eirmod sea ut est at amet diam, et lorem ut dolor duo."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
