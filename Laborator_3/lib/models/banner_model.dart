class BannerItem {
  final String title;
  final String description;
  final String image;

  BannerItem({
    required this.title,
    required this.description,
    required this.image,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
