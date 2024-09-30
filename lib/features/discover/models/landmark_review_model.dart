class LandmarkReviews {
  Landmark? landmark;
  List<Review>? reviews;

  LandmarkReviews({
    this.landmark,
    this.reviews,
  });

  factory LandmarkReviews.fromJson(Map<String, dynamic> json) => LandmarkReviews(
    landmark: json["landmark"] == null ? null : Landmark.fromJson(json["landmark"]),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "landmark": landmark?.toJson(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class Landmark {
  int? id;
  String? image;
  String? landmarkName;
  String? description;
  String? address;
  String? city;
  int? cityId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Landmark({
    this.id,
    this.image,
    this.landmarkName,
    this.description,
    this.address,
    this.city,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  factory Landmark.fromJson(Map<String, dynamic> json) => Landmark(
    id: json["id"],
    image: json["image"],
    landmarkName: json["landmark_name"],
    description: json["description"],
    address: json["address"],
    city: json["city"],
    cityId: json["city_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "landmark_name": landmarkName,
    "description": description,
    "address": address,
    "city": city,
    "city_id": cityId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Review {
  int? id;
  int? landmarkId;
  int? userId;
  String? comment;
  double? rating;
  DateTime? createdAt;
  DateTime? updatedAt;

  Review({
    this.id,
    this.landmarkId,
    this.userId,
    this.comment,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    landmarkId: json["landmark_id"],
    userId: json["user_id"],
    comment: json["comment"],
    rating: json["rating"]?.toDouble(),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "landmark_id": landmarkId,
    "user_id": userId,
    "comment": comment,
    "rating": rating,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
