class TrashEntity {
  final List<String> className;
  final String image;
  final String? createdAt;

  TrashEntity({
    required this.className,
    required this.image,
    this.createdAt,
  });

  TrashEntity copyWith({
    List<String>? className,
    String? image,
    String? createdAt,
  }) {
    return TrashEntity(
      className: className ?? this.className,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
