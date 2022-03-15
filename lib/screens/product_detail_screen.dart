import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String? title;
  // final String? price;
  // ProductDetailScreen(this.title, this.price);

  static const routeName = 'product-details';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findByID(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl!, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text('\$${loadedProduct.price}', style: TextStyle(color: Colors.grey, fontSize: 30),),
            const  SizedBox(height: 10),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text('${loadedProduct.description}',textAlign: TextAlign.center, softWrap: true,))
          ],
        ),
      ),
    );
  }
}
