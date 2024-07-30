class Order {
  final String id;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final String status;
  final String userId;
  final DateTime createdAt;
  final String type;

  Order({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.status,
    required this.userId,
    required this.createdAt,
    required this.type,
  });
}
