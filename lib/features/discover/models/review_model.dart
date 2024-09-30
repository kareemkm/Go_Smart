
class Review {
  int? id;
  int? userId;
  String? comment;
  double? rating;
  DateTime? createdAt;
  DateTime? updatedAt;

  Review({
    this.id,
    this.userId,
    this.comment,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    userId: json["user_id"],
    comment: json["comment"],
    rating: json["rating"]?.toDouble(),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "comment": comment,
    "rating": rating,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
