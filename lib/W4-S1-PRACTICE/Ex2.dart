import 'package:flutter/material.dart';

enum Product {
  dart(
    'Dart',
    'the best object language',
    'assets/logos/Dart.png',
  ),
  flutter(
    'Flutter',
    'The best mobile widget library',
    'assets/logos/Flutter.png',
  ),
  firebase(
    'Firebase',
    'The best cloud database',
    'assets/logos/Firebase.png',
  );

  final String title;
  final String description;
  final String imagePath;
  const Product(this.title, this.description, this.imagePath);
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ));

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Adds spacing between cards
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  product.imagePath,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 10), // Spacing between image and title
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
