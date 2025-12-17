class TrashEntity {
  final List<String> className;
  final String image;

  TrashEntity({
    required this.className,
    required this.image,
  });

  TrashEntity copyWith({
    List<String>? className,
    String? image,
  }) {
    return TrashEntity(
      className: className ?? this.className,
      image: image ?? this.image,
    );
  }
}
