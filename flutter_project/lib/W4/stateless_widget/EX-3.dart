import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'The best object language',
    imagePath: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    imagePath: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    imagePath: 'assets/ex3/firebase.png',
  );

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imagePath),
            SizedBox(height: 8),

            Text(
              product.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Text(product.description),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.grey, title: Text('Products')),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductCard(product: Product.dart),
                ProductCard(product: Product.flutter),
                ProductCard(product: Product.firebase),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
