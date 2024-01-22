// Common base class for exercises
class Exercise {
  final String name;
  final String focus;
  final String equipment;
  final String imageAsset;
  final String videoUrl;

  Exercise({
    required this.name,
    required this.focus,
    required this.equipment,
    required this.imageAsset,
    required this.videoUrl,
  });
}