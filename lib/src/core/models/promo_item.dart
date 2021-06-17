class PromoItem {
  String title;
  double oldValue;
  double newValue;
  String image;

  PromoItem({
    this.title,
    this.oldValue,
    this.newValue,
    this.image,
  });

  factory PromoItem.fromMap(Map<String, dynamic> map) {
    return PromoItem(
      title: map["title"],
      oldValue: map["oldValue"],
      newValue: map["newValue"],
      image: map["image"],
    );
  }
}
