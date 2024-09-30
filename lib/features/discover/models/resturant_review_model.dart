
class ResturantReview {
  Resturant? resturant;
  List<Review>? reviews;

  ResturantReview({
    this.resturant,
    this.reviews,
  });

  factory ResturantReview.fromJson(Map<String, dynamic> json) => ResturantReview(
    resturant: json["resturant"] == null ? null : Resturant.fromJson(json["resturant"]),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resturant": resturant?.toJson(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class Resturant {
  int? id;
  String? address;
  String? city;
  String? description;
  String? image;
  String? resturantName;
  String? rating;
  String? website;
  int? cityId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Resturant({
    this.id,
    this.address,
    this.city,
    this.description,
    this.image,
    this.resturantName,
    this.rating,
    this.website,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
    id: json["id"],
    address: json["address"],
    city: json["city"],
    description: json["description"],
    image: json["image"],
    resturantName: json["resturant_name"],
    rating: json["rating"],
    website: json["website"],
    cityId: json["city_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "city": city,
    "description": description,
    "image": image,
    "resturant_name": resturantName,
    "rating": rating,
    "website": website,
    "city_id": cityId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Review {
  int? id;
  int? resturantId;
  int? userId;
  String? comment;
  double? rating;
  DateTime? createdAt;
  DateTime? updatedAt;

  Review({
    this.id,
    this.resturantId,
    this.userId,
    this.comment,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    resturantId: json["resturant_id"],
    userId: json["user_id"],
    comment: json["comment"],
    rating: json["rating"]?.toDouble(),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "resturant_id": resturantId,
    "user_id": userId,
    "comment": comment,
    "rating": rating,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
