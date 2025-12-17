class Wasteinfoentity {
  final int id;
  final String className;
  final String category;
  final String definition;
  final List<String> managements;
  final List<String> collectionSites;
  final List<String> recycles;

  Wasteinfoentity({
    required this.id,
    required this.className,
    required this.category,
    required this.definition,
    required this.managements,
    required this.collectionSites,
    required this.recycles,
  });
}
