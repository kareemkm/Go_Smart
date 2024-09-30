// Define your Landmarkss class and its fromJson factory method as before
class Landmarkss {
  final int id;
  final String image;
  final String landmarkName;
  final String description;
  final String address;
  final String city;
  final int cityId;
  final String createdAt;
  final String updatedAt;

  Landmarkss({
    required this.id,
    required this.image,
    required this.landmarkName,
    required this.description,
    required this.address,
    required this.city,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Landmarkss.fromJson(Map<String, dynamic> json) {
    return Landmarkss(
      id: json['id'] ?? 0,
      image: json['image'].toString().replaceAll(r"\/", "/"), // Replace escaped forward slashes
      landmarkName: json['landmark_name'] ?? "",
      description: json['description'] ?? "",
      address: json['address'].toString().replaceAll(r"\/", "/") ?? "",
      city: json['city'] ?? "",
      cityId: json['city_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}