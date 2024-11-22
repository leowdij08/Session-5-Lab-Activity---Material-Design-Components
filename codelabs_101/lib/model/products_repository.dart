import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.nonspicy,
        id: 0,
        isFeatured: true,
        name: 'Grilled Chicken Rice Original',
        packetname: 'MACHE1',
        price: 15000, // Price in IDR
        imagePath: 'assets/nasibakar1.jpg',
        description: 'Enjoy the delicious Grilled Chicken Rice Original with a tasty flavor of chicken seasoned with traditional spices, wrapped in banana leaves.',
      ),
      Product(
        category: Category.spicy,
        id: 1,
        isFeatured: true,
        name: 'Spicy Grilled Chicken Rice',
        packetname: 'MACHE2',
        price: 15000,
        imagePath: 'assets/nasibakar2.jpg',
        description: 'Spicy Grilled Chicken Rice with a bold spicy flavor that will satisfy your cravings for heat and deliciousness.',
      ),
      Product(
        category: Category.spicy,
        id: 2,
        isFeatured: false,
        name: 'Grilled Chicken Rice with Balado',
        packetname: 'MACHE3',
        price: 15000,
        imagePath: 'assets/nasibakar3.jpg',
        description: 'Grilled Chicken Rice with Balado provides a sweet and spicy flavor from Balado chili paste combined with tender chicken.',
      ),
      Product(
        category: Category.nonspicy,
        id: 3,
        isFeatured: true,
        name: 'Grilled Chicken Rice with Yellow Spices',
        packetname: 'MACHE4',
        price: 15000,
        imagePath: 'assets/nasibakar4.jpg',
        description: 'Grilled Chicken Rice with a fragrant aroma of yellow spices and tender chicken wrapped in banana leaves.',
      ),
      Product(
        category: Category.spicy,
        id: 4,
        isFeatured: false,
        name: 'Grilled Chicken Rice with Sambal Matah',
        packetname: 'MACHE5',
        price: 15000,
        imagePath: 'assets/nasibakar5.jpg',
        description: 'Grilled Chicken Rice with Sambal Matah offers a fresh, spicy sensation with Balinese chili topping.',
      ),
      Product(
        category: Category.nonspicy,
        id: 5,
        isFeatured: false,
        name: 'Grilled Chicken Rice with Soy Sauce',
        packetname: 'MACHE6',
        price: 15000,
        imagePath: 'assets/nasibakar6.jpg',
        description: 'A sweet and savory Grilled Chicken Rice flavored with soy sauce, bringing out a delicious umami taste.',
      ),
    ];

    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
