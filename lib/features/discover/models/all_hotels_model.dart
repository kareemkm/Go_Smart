class AllHotels {
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

    AllHotels({
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

    factory AllHotels.fromJson(Map<String, dynamic> json) => AllHotels(
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
