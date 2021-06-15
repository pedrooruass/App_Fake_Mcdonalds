class MenuItem {
  String title;
  String image;
  double price;

  MenuItem({
    this.title,
    this.image,
    this.price,
  });
  // factory: Para conseguir usar o return no construtor
  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      title: map["title"],
      image: map["image"],
      price: map["price"],
    );
  }

  @override
  String toString() => 'MenuItem(title: $title | image: $image | price: $price)';
}
