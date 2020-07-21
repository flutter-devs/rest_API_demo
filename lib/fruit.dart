class Fruit {
  final int id;
  final String title;
  final String imageUrl;
  final int quantity;

  Fruit(
    this.id,
    this.title,
    this.imageUrl,
    this.quantity,
  );
  factory Fruit.fromMap(Map<String, dynamic> json) {
    return Fruit(json['id'], json['title'], json['imageUrl'], json['quantity']);
  }
  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(json['id'], json['title'], json['imageUrl'], json['quantity']);
  }
}
