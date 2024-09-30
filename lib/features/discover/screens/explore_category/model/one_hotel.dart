
class OneHotel {
    Hotel? hotel;
    Hotelreview? hotelreview;

    OneHotel({
        this.hotel,
        this.hotelreview,
    });

    factory OneHotel.fromJson(Map<String, dynamic> json) => OneHotel(
        hotel: json["hotel"] == null ? null : Hotel.fromJson(json["hotel"]),
        hotelreview: json["hotelreview"] == null ? null : Hotelreview.fromJson(json["hotelreview"]),
    );

    Map<String, dynamic> toJson() => {
        "hotel": hotel?.toJson(),
        "hotelreview": hotelreview?.toJson(),
    };
}

class Hotel {
    int? id;
    String? city;
    String? image1;
    String? image2;
    String? image3;
    String? hotelName;
    String? rating;
    String? urlGoogleMap;
    String? website;
    int? cityId;
    dynamic description;
    DateTime? createdAt;
    DateTime? updatedAt;

    Hotel({
        this.id,
        this.city,
        this.image1,
        this.image2,
        this.image3,
        this.hotelName,
        this.rating,
        this.urlGoogleMap,
        this.website,
        this.cityId,
        this.description,
        this.createdAt,
        this.updatedAt,
    });

    factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        city: json["city"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        hotelName: json["hotel_name"],
        rating: json["rating"],
        urlGoogleMap: json["url_google_map"],
        website: json["website"],
        cityId: json["city_id"],
        description: json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "hotel_name": hotelName,
        "rating": rating,
        "url_google_map": urlGoogleMap,
        "website": website,
        "city_id": cityId,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Hotelreview {
    int? id;
    int? hotelId;
    int? userId;
    String? comment;
    var rating;
    DateTime? createdAt;
    DateTime? updatedAt;

    Hotelreview({
        this.id,
        this.hotelId,
        this.userId,
        this.comment,
        this.rating,
        this.createdAt,
        this.updatedAt,
    });

    factory Hotelreview.fromJson(Map<String, dynamic> json) => Hotelreview(
        id: json["id"],
        hotelId: json["hotel_id"],
        userId: json["user_id"],
        comment: json["comment"],
        rating: json["rating"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hotel_id": hotelId,
        "user_id": userId,
        "comment": comment,
        "rating": rating,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
