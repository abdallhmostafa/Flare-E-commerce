class CategoryEntity {
  final String categoryId;
  final String? title;
  final String? image;

  CategoryEntity({
    required this.categoryId,
    required this.title,
    required this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryEntity &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.image == image;
  }

  @override
  int get hashCode => categoryId.hashCode ^ title.hashCode ^ image.hashCode;
}
