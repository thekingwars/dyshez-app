class OrderModel {
  final String id;
  final String createdAt;
  final String productName;
  final String productImage;
  final num productPrice;
  final num productQuantity;
  final String productType;
  final bool productStatus;
  final String userId;

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.productType,
    required this.productStatus,
    required this.userId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      createdAt: json['created_at'],
      productName: json['product_name'],
      productImage: json['product_image'],
      productPrice: json['product_price'],
      productQuantity: json['product_quantity'],
      productType: json['product_type'],
      productStatus: json['product_status'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'product_image': productImage,
      'product_price': productPrice,
      'product_quantity': productQuantity,
      'product_type': productType,
      'product_status': productStatus,
      'user_id': userId,
    };
  }
}
