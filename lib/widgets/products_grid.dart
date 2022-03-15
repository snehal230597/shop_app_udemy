import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {

  final bool? showFavs;
    ProductGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final ProductsData = Provider.of<Products>(context);
    final products = showFavs! ? ProductsData.favoriteItem : ProductsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value : products[i],
        child: ProductItem(

            // products[i].id!,
            //  products[i].title!,
            //  products[i].imageUrl!,
            ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2),
    );
  }
}



