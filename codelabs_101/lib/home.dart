import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/product.dart';
import 'model/products_repository.dart'; // Import the products repository

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  // Create product cards based on available product list
  List<Card> _buildGridCards(BuildContext context) {
    final products = ProductsRepository.loadProducts(category); // Use the repository to load products

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID', // Changed to Indonesian Rupiah (IDR)
      symbol: 'Rp ', // IDR symbol
      decimalDigits: 0,
    );

    return products.map((Product product) {
      return Card(
        color: const Color.fromARGB(255, 223, 234, 224), // Light greenish color
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.packetname, // No maxLines, full name will be shown
                        style: theme.textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis, // Text overflow handling
                        softWrap: true, // Allow wrapping for long names
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        formatter.format(product.price), // Price in IDR
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // White background
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'id_ID', // Changed to Indonesian Rupiah (IDR)
      symbol: 'Rp ', // IDR symbol
      decimalDigits: 0,
    );

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          product.packetname,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Column(
        children: <Widget>[
          // Image section
          AspectRatio(
            aspectRatio: 16 / 9, // Ensure image is always landscape
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),

          // Title section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              product.name,
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 8.0),

          // Description section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              product.description,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ),

          const SizedBox(height: 16.0),

          // Price section (moved below description)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                formatter.format(product.price),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const Spacer(),

          // Button section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    print('Calling...');
                  },
                  icon: const Icon(Icons.phone, color: Colors.white),
                  label: const Text('Call', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC34A),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    print('Buying...');
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text('Buy', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC34A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
