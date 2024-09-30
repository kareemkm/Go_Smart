
class RecommendationAi {
  List<Recommendation>? recommendations;

  RecommendationAi({
    this.recommendations,
  });

  factory RecommendationAi.fromJson(Map<String, dynamic> json) => RecommendationAi(
    recommendations: json["recommendations"] == null ? [] : List<Recommendation>.from(json["recommendations"]!.map((x) => Recommendation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "recommendations": recommendations == null ? [] : List<dynamic>.from(recommendations!.map((x) => x.toJson())),
  };
}

class Recommendation {
  int? day;
  String? hotel;
  String? place;
  String? restaurant;

  Recommendation({
    this.day,
    this.hotel,
    this.place,
    this.restaurant,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
    day: json["day"],
    hotel: json["hotel"],
    place: json["place"],
    restaurant: json["restaurant"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "hotel": hotel,
    "place": place,
    "restaurant": restaurant,
  };
}
