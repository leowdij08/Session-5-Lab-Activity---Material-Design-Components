enum Category {
  all,
  spicy,
  nonspicy,
}

class Product {
  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.packetname,
    required this.price,
    required this.imagePath,
    required this.description,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final String packetname;
  final int price;
  final String imagePath;
  final String description;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id, harga=$price)";
}
